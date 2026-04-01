variable "instance_type" {
    description = "EC2 instance type for the launch template"
    type = string
    default = "t3.micro"
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for ASG"
  type = list(string)
}

variable "target_group_arn" {
  description = "ALB target group ARN for ASG"
  type = string
}

variable "instance_profile_name" {
  description = "IAM instance profile name for launch template"
  type = string
}

variable "web_sg_id" {
  description = "Web security group ID for launch template"
  type = string
}