resource "aws_subnet" "Public-subnet-1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.range1
  availability_zone = var.zones1
  tags = {
    Name        = "Public-subnet-1"
    Description = "First public subnet for custom VPC in Project1"
  }
}

resource "aws_subnet" "Public-subnet-2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.range2
  availability_zone = var.zones2
  tags = {
    Name        = "Public-subnet-2"
    Description = "Second public subnet for custom VPC in Project1"
  }
}

resource "aws_subnet" "Private-subnet-1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.range3
  availability_zone = var.zones1
  tags = {
    Name        = "Private-subnet-1"
    Description = "First private subnet for custom VPC in Project1"
  }
}

resource "aws_subnet" "Private-subnet-2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.range4
  availability_zone = var.zones2
  tags = {
    Name        = "Private-subnet-2"
    Description = "Second private subnet for custom VPC in Project1"
  }
}

output "public_subnet_ids" {
  value = [
    aws_subnet.Public-subnet-1.id,
    aws_subnet.Public-subnet-2.id,
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.Private-subnet-1.id,
    aws_subnet.Private-subnet-2.id,
  ]
}

output "public_subnet1_id" {
  value = aws_subnet.Public-subnet-1.id
}

output "public_subnet2_id" {
  value = aws_subnet.Public-subnet-2.id
}