variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-2"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version"
  default     = "1.27"
}

variable "node_desired_capacity" {
  type        = number
  description = "Desired node group capacity"
  default     = 2
}

variable "node_min_size" {
  type        = number
  description = "Minimum node group size"
  default     = 1
}

variable "node_max_size" {
  type        = number
  description = "Maximum node group size"
  default     = 3
}

variable "node_instance_types" {
  type        = list(string)
  description = "EC2 instance types for node group"
  default     = ["t3.micro"]
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones"
  default     = ["us-east-2a", "us-east-2b"]
}

variable "environment" {
  type        = string
  description = "Environment tag" 
  default     = "dev"
}
