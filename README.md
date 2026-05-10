# Origoss DevOps Assignment

This repository contains my solution for the Origoss DevOps assignment.

The project includes:
- a simple Go HTTP server
- Docker containerization
- CI pipeline with GitHub Actions
- Kubernetes deployment manifests
- Terraform infrastructure for provisioning and deployment on AWS EKS

---

## Table of Contents

- Project Overview
- Technologies Used
- Prerequisites
- HTTP Server
- Dockerization
- CI Pipeline
- Kubernetes Deployment
- Terraform Infrastructure
- Deployment Verification

---

# Project Overview

The application is a lightweight HTTP server written in Go.

Available endpoints:

| Endpoint | Description |
|---|---|
| `/` | Returns `Hello, World!` |
| `/health` | Health check endpoint |

The application listens on port `3000`.

The main goal of the project was not the application itself, but the complete DevOps workflow around it:
- containerization
- CI/CD automation
- Kubernetes deployment
- Terraform-based infrastructure provisioning

---

# Technologies Used

- Go
- Docker
- GitHub Actions
- Kubernetes
- Terraform
- AWS EKS
- GitHub Container Registry (GHCR)

---

# Prerequisites

The following tools are required to run or deploy the project:

- Go
- Docker
- kubectl
- Terraform
- AWS CLI

---

# Repository Structure

```text
.
├── cmd/server
├── k8s
├── terraform
│   ├── modules
│   │   ├── eks
│   │   └── vpc
├── .github/workflows
├── Dockerfile
└── README.md
```

---

# 1. HTTP Server

The HTTP server was implemented in Go using the standard library.

Features:
- configurable port
- `/health` endpoint
- minimal dependency usage

Run locally:

```bash
go run ./cmd/server
```

Test:

```bash
curl http://localhost:3000
```

Expected response:

```text
Hello, World!
```

---

# 2. Dockerization

The application is containerized using a multi-stage Docker build.

Build image:

```bash
docker build -t origoss-hello-world .
```

Run container:

```bash
docker run -p 3000:3000 origoss-hello-world
```

---

# 3. CI Pipeline

GitHub Actions is used for CI/CD.

The pipeline:
- checks out the repository
- builds the Docker image
- authenticates to GitHub Container Registry
- pushes the image to GHCR

Workflow location:

```text
.github/workflows/
```

Published image:

```text
ghcr.io/bukovinszkiakos/origoss-devops-assignment:latest
```

---

# 4. Kubernetes Deployment

Kubernetes manifests are located in:

```text
k8s/
```

Resources:
- Namespace
- Deployment
- Service

The deployment creates:
- 2 application replicas
- readiness probe
- liveness probe
- CPU and memory limits

---

# 5. Terraform Infrastructure

Terraform is used to provision AWS infrastructure and deploy the Kubernetes resources.

Infrastructure includes:
- VPC
- public/private subnets
- NAT gateway
- EKS cluster
- managed node group
- Kubernetes provider configuration

Terraform provisions an AWS EKS cluster and deploys the Kubernetes manifests automatically.

Terraform modules:

```text
terraform/modules/vpc
terraform/modules/eks
```

Deploy infrastructure:

```bash
cd terraform

terraform init
terraform plan
terraform apply
```

Destroy infrastructure:

```bash
terraform destroy
```

---

# Kubernetes Cluster Provisioning Steps

1. Configure AWS credentials
2. Initialize Terraform
3. Apply Terraform configuration
4. Update kubeconfig
5. Verify cluster resources

Update kubeconfig:

```bash
aws eks update-kubeconfig \
  --region eu-central-1 \
  --name origoss-eks-cluster
```

Verify deployment:

```bash
kubectl get all -n origoss
```

---

# Deployment Verification

Successful deployment verification using kubectl:

<img width="822" height="262" alt="image_1" src="https://github.com/user-attachments/assets/e9a52200-83b1-42ac-91e2-72c988636a83" />

Successful Terraform infrastructure cleanup:

<img width="728" height="369" alt="image_2" src="https://github.com/user-attachments/assets/3e43292b-fbcf-444f-876d-3dd73ddb731f" />

---

# Notes

- Terraform state files and provider binaries are excluded from version control.
- The solution was intentionally kept simple and lightweight.
- Standard tooling and minimal external dependencies were preferred where possible.

---

# Author

Ákos Bukovinszki

---

<p align="right">(<a href="#top">Back to top</a>)</p>
