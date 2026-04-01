variable "cidr4" {
    description = "CIDR block for IPv4 traffic"
    type = string
    default = "0.0.0.0/0"
}

variable "vpc_id" {
  description = "VPC ID where security groups are created"
  type        = string
}