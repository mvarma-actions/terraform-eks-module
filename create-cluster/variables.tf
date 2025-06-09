variable "region" {
  default = "us-east-2"
}

variable "cluster_name" {
  default = "my-eks-cluster"
}

variable "cluster_version" {
  default = "1.27"
}

variable "node_desired_capacity" {
  default = 2
}

variable "node_min_size" {
  default = 1
}

variable "node_max_size" {
  default = 3
}

variable "node_instance_types" {
  default = ["t3.micro"]
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "azs" {
  default = ["us-east-2a", "us-east-2b"]
}

variable "environment" {
  default = "dev"
}
