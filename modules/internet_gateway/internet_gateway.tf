resource "aws_internet_gateway" "IGW-custom_VPC" {
  tags = {
    Name = "IGW-custom_VPC"
    Description = "Internet Gateway for custom VPC in Project1"
  }
}

resource "aws_internet_gateway_attachment" "IGW-attachment-custom_VPC" {
  internet_gateway_id = aws_internet_gateway.IGW-custom_VPC.id
  vpc_id              = var.vpc_id
}

output "igw_id" {
  value = aws_internet_gateway.IGW-custom_VPC.id
}