
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



variable "kubernetes_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.34"
}

variable "node_instance_type" {
  description = "EC2 instance type for EKS worker nodes"
  type        = string
  default     = "t3.large"
}

variable "desired_node_count" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 3
}
