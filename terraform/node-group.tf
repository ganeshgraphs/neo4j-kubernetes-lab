
resource "aws_eks_node_group" "lab" {
  cluster_name    = aws_eks_cluster.lab.name
  node_group_name = "${var.cluster_name}-workers"
  node_role_arn   = aws_iam_role.eks_node.arn

  subnet_ids = [
    "subnet-0542501bae5d84413",
    "subnet-05fda619a3ddfdeb2",
    "subnet-0b58fd34d55976ff8"
  ]

  instance_types = [var.node_instance_type]
  capacity_type  = "ON_DEMAND"

  scaling_config {
    desired_size = var.desired_node_count
    min_size     = 1
    max_size     = var.desired_node_count
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node,
    aws_iam_role_policy_attachment.eks_cni,
    aws_iam_role_policy_attachment.ecr_pull
  ]

  tags = {
    Project = "neo4j-kubernetes-lab"
  }
}
