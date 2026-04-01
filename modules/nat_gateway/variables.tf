variable "availability_zone1" {
    description = "The availability zone for the first NAT Gateway."
    type        = string
    default     = "us-east-1a"
}

variable "availability_zone2" {
    description = "The availability zone for the second NAT Gateway."
    type        = string
    default     = "us-east-1b"
}

variable "eip1_id" {
  description = "Elastic IP allocation id for NATGW1"
  type        = string
}

variable "eip2_id" {
  description = "Elastic IP allocation id for NATGW2"
  type        = string
}

variable "public_subnet1_id" {
  description = "Subnet ID for NATGW1"
  type        = string
}

variable "public_subnet2_id" {
  description = "Subnet ID for NATGW2"
  type        = string
}