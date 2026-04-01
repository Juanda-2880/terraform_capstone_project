resource "aws_lb_target_group" "lb_tg" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.custom_vpc.id
  deregistration_delay = var.dereg_delay
  tags = {
    Name = "tf-example-lb-tg"
    Description = "Target group for ALB in Project1"
  }
}