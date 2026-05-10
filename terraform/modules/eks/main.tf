module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name = var.cluster_name

  cluster_version = "1.33"

  cluster_endpoint_public_access = true

  vpc_id = var.vpc_id

  subnet_ids = var.private_subnets

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.small"]

      min_size = 1
      max_size = 2
      desired_size = 1
    }
  }

  tags = {
    Environment = var.environment
    Terraform  = "true"
  }
}