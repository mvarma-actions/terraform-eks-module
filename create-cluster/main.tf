provider "aws" {
  region = var.region
}

module "eks_cluster" {
  source = "../module"

  region             = var.region
  cluster_name       = var.cluster_name
  cluster_version    = var.cluster_version
  node_desired_capacity = var.node_desired_capacity
  node_min_size      = var.node_min_size
  node_max_size      = var.node_max_size
  node_instance_types = var.node_instance_types
  vpc_cidr_block     = var.vpc_cidr_block
  azs                = var.azs
  environment        = var.environment
}
