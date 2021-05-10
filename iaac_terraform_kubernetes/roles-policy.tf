# Policy for eks-cluster

resource "aws_iam_role" "novinano-eks-cluster-role" {
  name = "novinano-eks-cluster-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}


resource "aws_iam_role_policy_attachment" "novinano-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.novinano-eks-cluster-role.name
}


resource "aws_iam_role_policy_attachment" "novinano-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.novinano-eks-cluster-role.name
}


resource "aws_iam_role_policy_attachment" "novinano-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.novinano-eks-cluster-role.name
}


# Policy for eks-cluster-node-group


resource "aws_iam_role" "novinano-eks-cluster-node-group-role" {
  name = "novinano-eks-cluster-node-group-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}


resource "aws_iam_role_policy_attachment" "novinano-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.novinano-eks-cluster-node-group-role.name
}


resource "aws_iam_role_policy_attachment" "novinano-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.novinano-eks-cluster-node-group-role.name
}


resource "aws_iam_role_policy_attachment" "novinano-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.novinano-eks-cluster-node-group-role.name
}
