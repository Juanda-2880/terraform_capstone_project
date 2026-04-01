resource "aws_nat_gateway" "NATGW1" {
    allocation_id = aws_eip.ngw_eip1.id
    subnet_id     = aws_subnet.public_subnet1.id    
    tags = {
        Name        = "NATGW1"
        Description = "NAT Gateway for public subnet in Project1"
    }
}

resource "aws_nat_gateway" "NATGW2" {
    allocation_id = aws_eip.ngw_eip2.id
    subnet_id     = aws_subnet.public_subnet2.id
    tags = {
        Name        = "NATGW2"
        Description = "NAT Gateway for public subnet in Project1"
    }
}