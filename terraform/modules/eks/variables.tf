variable "cluster_name" {
  description = "EKS cluster name"

  type = string
}

variable "environment" {
  description = "Deployment environment"

  type = string
}

variable "vpc_id" {
  description = "VPC ID"

  type = string
}

variable "private_subnets" {
  description = "Private subnet IDs"

  type = list(string)
}