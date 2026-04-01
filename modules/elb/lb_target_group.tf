resource "aws_lb_target_group" "lb_tg" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  deregistration_delay = var.dereg_delay
  tags = {
    Name = "tf-example-lb-tg"
    Description = "Target group for ALB in Project1"
  }
}

output "target_group_arn" {
  value = aws_lb_target_group.lb_tg.arn
}