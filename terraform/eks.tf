
data "aws_iam_role" "eks_cluster" {
  name = "neo4j-eks-lab-cluster-role"
}

resource "aws_eks_cluster" "lab" {
  name     = var.cluster_name
  role_arn = data.aws_iam_role.eks_cluster.arn
  version  = var.kubernetes_version

  vpc_config {
    subnet_ids = [
      "subnet-0542501bae5d84413",
      "subnet-05fda619a3ddfdeb2",
      "subnet-0b58fd34d55976ff8"
    ]

    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs = ["54.163.51.255/32"]
  }

  tags = {
    Project = "neo4j-kubernetes-lab"
  }
}
