resource "aws_eip" "ngw_eip1" {
    domain = "vpc"
    tags = {
        Name        = "EIP-NATGW1"
        Description = "Elastic IP for NAT Gateway 1 in Project1"
    }
}

resource "aws_eip" "ngw_eip2" {
    domain = "vpc"
    tags = {
        Name        = "EIP-NATGW2"
        Description = "Elastic IP for NAT Gateway 2 in Project1"
    }
}

output "eip1_id" {
  value = aws_eip.ngw_eip1.id
}

output "eip2_id" {
  value = aws_eip.ngw_eip2.id
}