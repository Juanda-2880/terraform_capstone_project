variable "range1" {
  description = "The CIDR block for the first public subnet."
  type        = string
  default     = "10.0.10.0/24"
}

variable "range2" {
    description = "The CIDR block for the second public subnet."
    type        = string
    default     = "10.0.20.0/24"
}

variable "zones1" {
    description = "The availability zone for the first public subnet."
    type        = string
    default     = "us-east-1a"
}

variable "zones2" {
    description = "The availability zone for the second public subnet."
    type        = string
    default     = "us-east-1b"
}