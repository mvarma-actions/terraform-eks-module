output "cluster_name" {
  value = module.eks_cluster.cluster_name
}

output "cluster_endpoint" {
  value = module.eks_cluster.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  value = module.eks_cluster.cluster_certificate_authority_data
}

output "vpc_id" {
  value = module.eks_cluster.vpc_id
}

output "public_subnet_ids" {
  value = module.eks_cluster.public_subnet_ids
}
