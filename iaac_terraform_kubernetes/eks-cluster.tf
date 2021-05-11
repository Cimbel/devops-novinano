resource "aws_eks_cluster" "novinano-eks-cluster" {
  name     = "novinano-eks-cluster"
  role_arn = aws_iam_role.novinano-eks-cluster-role.arn
  version  = "1.19"

  vpc_config {
    endpoint_public_access = true

    endpoint_private_access = false

    subnet_ids = [
      aws_subnet.novinano-public-subnet-a1.id,
      aws_subnet.novinano-public-subnet-b1.id,
      aws_subnet.novinano-private-subnet-a1.id,
      aws_subnet.novinano-private-subnet-b1.id
    ]
    security_group_ids = [aws_security_group.novinano-sec-group.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.novinano-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.novinano-AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.novinano-AmazonEKSVPCResourceController
  ]
}
