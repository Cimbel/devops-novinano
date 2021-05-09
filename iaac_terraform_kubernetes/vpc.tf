resource "aws_vpc" "novinano-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = { Name = "novinano-vpc" }
}


resource "aws_internet_gateway" "novinano-igw" {
  vpc_id = aws_vpc.novinano-vpc.id

  tags = { Name = "novinano-igw" }
}


resource "aws_subnet" "novinano-public-subnet-a1" {
  cidr_block              = "10.0.11.0/24"
  vpc_id                  = aws_vpc.novinano-vpc.id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = { Name = "novinano-public-subnet-a1" }
}


resource "aws_subnet" "novinano-public-subnet-b1" {
  cidr_block              = "10.0.21.0/24"
  vpc_id                  = aws_vpc.novinano-vpc.id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[1]

  tags = { Name = "novinano-public-subnet-b1" }
}
