include challenge.mk

# minikube
.PHONY: minikube-start-mac
minikube-start-mac:
	minikube start --kubernetes-version=v1.20.8 --memory 4096 --disk-size 40GB --vm-driver=virtualbox --bootstrapper=kubeadm --extra-config=kubelet.authentication-token-webhook=true --extra-config=kubelet.authorization-mode=Webhook --extra-config=scheduler.address=0.0.0.0 --extra-config=controller-manager.address=0.0.0.0
	minikube addons enable ingress
	sudo -- sh -c -e "echo '$$(minikube ip)	challenge.local.faurecia-aptoide.com' >> /etc/hosts"


.PHONY: minikube-start-ubuntu
minikube-start-ubuntu:
	minikube start --kubernetes-version=v1.20.8 --memory 4096 --disk-size 40GB --vm-driver=virtualbox --bootstrapper=kubeadm --extra-config=kubelet.authentication-token-webhook=true --extra-config=kubelet.authorization-mode=Webhook --extra-config=scheduler.address=0.0.0.0 --extra-config=controller-manager.address=0.0.0.0
	minikube addons enable ingress
	sudo -- sh -c -e "echo '$$(minikube ip)	challenge.local.faurecia-aptoide.com' >> /etc/hosts"

# context
.PHONY: context-minikube
context-minikube:
	kubectl config use-context minikube
