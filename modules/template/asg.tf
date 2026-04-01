resource "aws_autoscaling_group" "ASG" {
  vpc_zone_identifier = aws_subnet.Private-subnet[*].id
  health_check_type   = "ELB"
  desired_capacity    = 2
  max_size            = 4
  min_size            = 1
  target_group_arns   = [aws_lb_target_group.TG.arn]

  launch_template {
    id      = aws_launch_template.LT.id
    version = "$Latest"
  }
}