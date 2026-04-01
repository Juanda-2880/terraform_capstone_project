resource "aws_default_vpc" "custom_vpc" {
    cidr_block =  var.cidr_vpc
    enable_dns_hostnames = true
    enable_dns_support = true
  tags = {
    Name = "custom_VPC"
    Description = "Default VPC for Project1"
  }
}
