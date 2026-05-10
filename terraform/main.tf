module "vpc" {
  source = "./modules/vpc"

  cluster_name = var.cluster_name

  environment = var.environment

  aws_region = var.aws_region

  vpc_cidr = var.vpc_cidr

  private_subnets = var.private_subnets

  public_subnets = var.public_subnets
}


module "eks" {
  source = "./modules/eks"

  cluster_name = var.cluster_name

  environment = var.environment

  vpc_id = module.vpc.vpc_id

  private_subnets = module.vpc.private_subnets
}