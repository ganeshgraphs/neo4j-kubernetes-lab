
variable "aws_region" {
  description = "AWS region for the Neo4j Kubernetes lab"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "Existing VPC ID for the lab"
  type        = string
  default     = "vpc-0ce43d41dd560bf0d"
}

variable "cluster_name" {
  description = "Name of the EKS lab cluster"
  type        = string
  default     = "neo4j-eks-lab"
}
