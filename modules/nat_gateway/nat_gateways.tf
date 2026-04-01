resource "aws_nat_gateway" "NATGW1" {
    allocation_id = var.eip1_id
    subnet_id     = var.public_subnet1_id
    tags = {
        Name        = "NATGW1"
        Description = "NAT Gateway for public subnet in Project1"
    }
}

resource "aws_nat_gateway" "NATGW2" {
    allocation_id = var.eip2_id
    subnet_id     = var.public_subnet2_id
    tags = {
        Name        = "NATGW2"
        Description = "NAT Gateway for public subnet in Project1"
    }
}

output "natgw1_id" {
  value = aws_nat_gateway.NATGW1.id
}

output "natgw2_id" {
  value = aws_nat_gateway.NATGW2.id
}