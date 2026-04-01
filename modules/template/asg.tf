resource "aws_autoscaling_group" "ASG" {
  vpc_zone_identifier = var.private_subnet_ids
  health_check_type   = "ELB"
  desired_capacity    = 2
  max_size            = 4
  min_size            = 1
  target_group_arns   = [var.target_group_arn]

  launch_template {
    id      = aws_launch_template.WebLT.id
    version = "$Latest"
  }
}

output "asg_name" {
  value = aws_autoscaling_group.ASG.name
}