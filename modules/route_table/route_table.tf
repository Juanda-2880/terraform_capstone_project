resource "aws_default_route_table" "Public-RT" {
    default_route_table_id = aws_vpc.custom_vpc.default_route_table_id
    route {
        cidr_block = var.cidr1
        gateway_id = aws_internet_gateway.IGW-custom_VPC.id
    }
    route {
        cidr_block = var.cidr2
        gateway_id = "local"
    }
  tags = {
    Name = "Public-RT"
    Description = "Default Route Table for custom VPC in Project1"
  }
}

resource "aws_route_table_association" "public_subnet1" {
  depends_on     = [aws_subnet.Public_Subnet1]
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.Public_Subnet1.id
}

resource "aws_route_table_association" "public_subnet2" {
  depends_on     = [aws_subnet.Public_Subnet2]
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.Public_Subnet2.id
}