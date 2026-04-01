resource "aws_security_group" "WebSG" {
    name        = "WebSG"
    description = "Allow HTTP traffic"
    vpc_id      = var.vpc_id

    ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = [var.cidr4]
      description = "Allow HTTP inbound"
    }

    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = [var.cidr4]
      description = "Allow all outbound"
    }

    tags = {
      Name = "WebSG"
    }
}

output "web_security_group_id" {
  value = aws_security_group.WebSG.id
}
