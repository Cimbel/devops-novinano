locals {
  novinano_vpc_id = aws_vpc.novinano-vpc.id
}


# vpc

resource "aws_vpc" "novinano-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = { Name = "novinano-vpc" }
}


# internet_gateway

resource "aws_internet_gateway" "novinano-igw" {
  vpc_id = local.novinano_vpc_id

  tags = { Name = "novinano-igw" }
}


# route_table

resource "aws_route_table" "novinano-public-subnets-route-table" {
  vpc_id = local.novinano_vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.novinano-igw.id
  }

  tags = { Name = "novinano-public-subnets-route-table" }
}


resource "aws_route_table_association" "association_public_subnet_a1" {
  subnet_id      = aws_subnet.novinano-public-subnet-a1.id
  route_table_id = aws_route_table.novinano-public-subnets-route-table.id
}


resource "aws_route_table_association" "association_public_subnet_b1" {
  subnet_id      = aws_subnet.novinano-public-subnet-b1.id
  route_table_id = aws_route_table.novinano-public-subnets-route-table.id
}


# public_subnets

resource "aws_subnet" "novinano-public-subnet-a1" {
  cidr_block              = "10.0.11.0/24"
  vpc_id                  = local.novinano_vpc_id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name                        = "novinano-public-subnet-us-east-1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}


resource "aws_subnet" "novinano-public-subnet-b1" {
  cidr_block              = "10.0.21.0/24"
  vpc_id                  = local.novinano_vpc_id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[1]

  tags = {
    Name                        = "novinano-public-subnet-us-east-1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}


# private_subnets

resource "aws_subnet" "novinano-private-subnet-a1" {
  cidr_block        = "10.0.12.0/24"
  vpc_id            = local.novinano_vpc_id
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name                              = "novinano-private-subnet-us-east-1a"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}


resource "aws_subnet" "novinano-private-subnet-b1" {
  cidr_block        = "10.0.22.0/24"
  vpc_id            = local.novinano_vpc_id
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name                              = "novinano-private-subnet-us-east-1b"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}
