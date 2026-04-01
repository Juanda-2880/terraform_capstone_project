variable "dereg_delay" {
    description = "Deregistration delay for the target group"
    type = number
    default = 10
}

variable "vpc_id" {
  description = "VPC ID for target group and any other ALB resources"
  type = string
}

variable "alb_sg_id" {
  description = "Security group ID for ALB"
  type = string
}

variable "public_subnet_ids" {
  description = "Public subnets IDs for ALB"
  type = list(string)
}