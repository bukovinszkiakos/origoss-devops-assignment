variable "aws_region" {
  description = "AWS region for the infrastructure"

  type = string

  default = "eu-central-1"
}

variable "cluster_name" {
  description = "EKS cluster name"

  type = string

  default = "origoss-eks-cluster"
}

variable "environment" {
  description = "Deployment environment"

  type = string

  default = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"

  type = string

  default = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "Private subnet CIDR blocks"

  type = list(string)

  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

variable "public_subnets" {
  description = "Public subnet CIDR blocks"

  type = list(string)

  default = [
    "10.0.101.0/24",
    "10.0.102.0/24"
  ]
}