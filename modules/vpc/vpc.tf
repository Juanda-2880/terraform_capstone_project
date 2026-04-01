resource "aws_vpc" "custom_vpc" {
  cidr_block           = var.cidr_vpc
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "custom_VPC"
    Description = "VPC for Project1"
  }
}

output "vpc_id" {
  value = aws_vpc.custom_vpc.id
}
