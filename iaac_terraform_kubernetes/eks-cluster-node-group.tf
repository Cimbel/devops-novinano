resource "aws_eks_node_group" "novinano-eks-cluster-node-group" {
  cluster_name    = aws_eks_cluster.novinano-eks-cluster.name
  node_group_name = "novinano-eks-cluster-node-group"
  node_role_arn   = aws_iam_role.novinano-eks-cluster-node-group-role.arn
  instance_types  = ["t3.small"]
  disk_size       = 8
  capacity_type   = "ON_DEMAND"

  subnet_ids = [
    aws_subnet.novinano-private-subnet-a1.id,
    aws_subnet.novinano-private-subnet-b1.id
  ]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.novinano-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.novinano-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.novinano-AmazonEC2ContainerRegistryReadOnly,
  ]
}
