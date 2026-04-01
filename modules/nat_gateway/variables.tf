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