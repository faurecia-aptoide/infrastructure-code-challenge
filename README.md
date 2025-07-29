# Appning – Infrastructure Code Challenge

Welcome! In this version of the challenge, you'll provision a Kubernetes environment using **Terraform** and deploy a Node.js application using Kubernetes manifests. The focus is on achieving **high availability**, **fault tolerance**, and **automation** using infrastructure-as-code practices.

We'd appreciate it if you could submit your solution within **1 week** of receiving the challenge. Feel free to contact us by email if you have any questions.

---

## 📦 Application to Deploy

You’ll be deploying the official [`nginxdemos/hello`](https://hub.docker.com/r/nginxdemos/hello) container.

This image is based on NGINX and serves an HTML page that displays useful runtime information such as:

- The internal IP address of the container
- Hostname and server address
- Request headers

This makes it ideal for demonstrating high availability and network routing within Kubernetes.

The application must be deployed with **high availability**, **fault tolerance**, and be **publicly accessible** (e.g., `http://<your-url>`).

---

## ✅ Your Tasks

### 1. 📐 Design the Architecture
- Describe the infrastructure and deployment stack you are using.
- Include a **diagram or schema** showing:
  - Cloud infrastructure components (networking, compute, load balancer)
  - Kubernetes components (Deployment, Service, Ingress, etc.)
  - Application access flow

---

### 2. ☁️ Provision Infrastructure Using Terraform
Use **Terraform** to provision a Kubernetes environment on your preferred provider. This can be either:

- **Managed Kubernetes** (e.g., EKS, AKS, GKE)
- **Self-managed Kubernetes** on virtual machines (e.g., EC2, GCE, Azure VM)

> **Note**: While any cloud provider or local VM solution is acceptable, AWS is strongly preferred. A cloud-native setup is encouraged, though self-managed Kubernetes remains an acceptable alternative.

Your Terraform code should provision:
- Networking (VPC, subnets, firewall rules, etc.)
- Compute resources (e.g., EC2 or managed nodes)
- Kubernetes cluster and any necessary IAM or service accounts

---

### 3. 🚀 Deploy the Application (Kubernetes Manifests)
Use raw Kubernetes manifests (`.yaml`) to deploy the application. Ensure your manifests include:

- A `Deployment` with multiple replicas
- A `Service` (NodePort, LoadBalancer, or Ingress)

The application must be accessible via a **public endpoint on a custom port**, e.g., `http://<your-url>:8080`.

---

### 4. 🛡 High Availability & Fault Tolerance
Ensure the following characteristics:
- ≥2 replicas
- Rolling update deployment strategy
- Automatic restarts on failure

---

## 🛠 Development Setup (Please Document)

In your submission, include:
- Operating system and local environment details
- Terraform version, Kubernetes version, and CLI tools used
- Cloud provider, region, and instance types (if applicable)
- How the application endpoint was verified
- A few lines explaining your development setup (how did you create or emulate the resources)

## 🧪 Bonus Points

These features are not required, but will be appreciated:

- ✅ Ingress controller with custom hostname
- ✅ HTTPS
- ✅ Liveness and readiness probes
- ✅ Zero-downtime deployments
- ✅ Monitoring setup (e.g., Prometheus/Grafana)

---

## 📤 Submission Instructions

- Submit your codebase as a `.zip` file or
- Share a publicly accessible download link (ensure it works in incognito mode)

> Please use **multiple commits** to show your progress and evolution of the solution.

 - If you’re unable to complete all aspects within the timeframe, please describe what you would improve or add with more time.

---

We look forward to reviewing your solution. Good luck!
