#!/bin/bash

# getting parameters
customPort=${1:-8080}

# installing docker
echo "Installing docker ..."
apt update && apt install ca-certificates curl gnupg lsb-release -y
mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update && apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# install kubectl
echo "Installing kubectl ..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x kubectl && mv kubectl /usr/local/bin

# install minikube
echo "Installing minikube ..."
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && mv minikube /usr/local/bin

# start ninikube
echo "Starting minikube ..."
minikube start --force



# creating the deployment
echo "Creating Deployment ..."
kubectl create deployment aptoid-challenge --replicas=2 --image=anfabio/aptoide-challenge:latest

# wait for deployment to be ready
echo "Waiting Deployment to be Ready ..."
kubectl wait --for=condition=available deployment/aptoid-challenge --timeout=10m

# wait for deployment to be ready
echo "Waiting Deployment to be Ready ..."

# expose the application
echo "Exposing the application ..."
kubectl expose deployment aptoid-challenge --type=NodePort --port=3000


# getting minikube service ip and port
minikube_url=$(minikube service aptoid-challenge --url | cut -d'/' -f3)
echo "Minikube URL: " $minikube_url

# installing HAProxy
echo "Installing HAProxy ..."
apt install haproxy -y

# creating configuration file
cat > /etc/haproxy/haproxy.cfg << EOF
defaults
  mode http
  timeout client 10s
  timeout connect 5s
  timeout server 10s
  timeout http-request 10s

frontend myfrontend
  bind 127.0.0.1:$customPort
  default_backend myservers

backend myservers
  server minikube $minikube_url
EOF

# restarting HAproxy service
systemctl restart haproxy.service

url="http://localhost:$customPort"

# opening the URL
echo "Accessing the aaplication ..."
curl "$url"
xdg-open "$url" 2>/dev/null
