resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.cidr1
    gateway_id = var.igw_id
  }

  route {
    cidr_block = var.cidr2
    gateway_id = "local"
  }

  tags = {
    Name        = "Public-Route-Table"
    Description = "Public route table for custom VPC in Project1"
  }
}

resource "aws_route_table_association" "public_subnet1" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = var.public_subnet1_id
}

resource "aws_route_table_association" "public_subnet2" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = var.public_subnet2_id
}

resource "aws_route_table" "Private_RT_1" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = var.cidr1
    nat_gateway_id = var.natgw1_id
  }

  route {
    cidr_block = var.cidr2
    gateway_id = "local"
  }

  tags = {
    Name        = "Private-RT-1"
    Description = "Route table for private subnet 1 in Project1"
  }
}

resource "aws_route_table_association" "private_subnet1" {
  route_table_id = aws_route_table.Private_RT_1.id
  subnet_id      = var.private_subnet1_id
}

resource "aws_route_table" "Private_RT_2" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = var.cidr1
    nat_gateway_id = var.natgw2_id
  }

  route {
    cidr_block = var.cidr2
    gateway_id = "local"
  }

  tags = {
    Name        = "Private-RT-2"
    Description = "Route table for private subnet 2 in Project1"
  }
}

resource "aws_route_table_association" "private_subnet2" {
  route_table_id = aws_route_table.Private_RT_2.id
  subnet_id      = var.private_subnet2_id
}

output "public_route_table_id" {
  value = aws_route_table.public_route_table.id
}
