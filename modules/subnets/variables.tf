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

variable "range3" {
    description = "The CIDR block for the first private subnet."
    type        = string
    default     = "10.0.100.0/24"
}

variable "range4" {
    description = "The CIDR block for the second private subnet."
    type        = string
    default     = "10.0.200.0/24"
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