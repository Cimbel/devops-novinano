locals {
  novinano_vpc_id = aws_vpc.novinano-vpc.id
}


resource "aws_vpc" "novinano-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = { Name = "novinano-vpc" }
}


resource "aws_internet_gateway" "novinano-igw" {
  vpc_id = local.novinano_vpc_id

  tags = { Name = "novinano-igw" }
}


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


resource "aws_subnet" "novinano-public-subnet-a1" {
  cidr_block              = "10.0.11.0/24"
  vpc_id                  = local.novinano_vpc_id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = { Name = "novinano-public-subnet-a1" }
}


resource "aws_subnet" "novinano-public-subnet-b1" {
  cidr_block              = "10.0.21.0/24"
  vpc_id                  = local.novinano_vpc_id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[1]

  tags = { Name = "novinano-public-subnet-b1" }
}
