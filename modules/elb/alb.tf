resource "aws_lb" "WebALB" {
    name               = "tf-example-web-alb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_vpc_security_group.ALBSG.id]
    subnets            = aws_subnet.public_subnet[*].id
    tags = {
        Name = "tf-example-web-alb"
        Description = "Application Load Balancer for Project1"
    }
  
}

resource "aws_lb_listener" "front" {
    load_balancer_arn = aws_lb.WebALB.arn
    port              = 80
    protocol          = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.lb_tg.arn
    }  
}