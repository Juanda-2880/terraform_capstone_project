resource "aws_vpc_security_group" "WebSG" {
    name = "WebSG"
    description = "Allow HTTP traffic"
    vpc_id = aws_vpc.custom_vpc.id
}

resource "aws_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_vpc_security_group.WebSG.id
  cidr_ipv4 = var.cidr4
  from_port = 80
  protocol = "tcp"
  to_port = 80
}

resource "aws_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_vpc_security_group.WebSG.id
  cidr_ipv4 = var.cidr4
  ip_protocol = "-1"
}
