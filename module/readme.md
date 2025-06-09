# EKS Cluster Terraform Module

This Terraform module creates an Amazon EKS cluster along with the necessary AWS resources such as VPC, subnets, node groups, and IAM roles.

---

## Features

- Creates a new VPC with public subnets
- Provisions an EKS cluster with specified Kubernetes version
- Creates managed node groups with configurable instance types and autoscaling settings
- Sets up necessary IAM roles and policies for EKS cluster and worker nodes
- Outputs cluster details for easy access and integration

---

## Usage

Here is an example of how to use this module in your Terraform configuration:

```hcl
module "eks" {
  source = "../module/eks-cluster"

  region                = "us-east-2"
  cluster_name          = "my-eks-cluster"
  cluster_version       = "1.27"
  node_desired_capacity = 2
  node_min_size         = 1
  node_max_size         = 3
  node_instance_types   = ["t3.micro"]
  vpc_cidr_block        = "10.0.0.0/16"
  azs                   = ["us-east-2a", "us-east-2b", "us-east-2c"]
  environment           = "dev"
}
