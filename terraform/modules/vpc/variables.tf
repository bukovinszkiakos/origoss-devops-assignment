variable "cluster_name" {
  description = "EKS cluster name"

  type = string
}

variable "environment" {
  description = "Deployment environment"

  type = string
}

variable "aws_region" {
  description = "AWS region"

  type = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"

  type = string
}

variable "private_subnets" {
  description = "Private subnet CIDR blocks"

  type = list(string)
}

variable "public_subnets" {
  description = "Public subnet CIDR blocks"

  type = list(string)
}