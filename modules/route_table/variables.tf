variable "cidr1" {
    description = "CIDR block for the first route in the route table"
    type        = string
    default     = "0.0.0.0/0"
}

variable "cidr2" {
    description = "CIDR block for the second route in the route table"
    type        = string
    default     = "10.0.0.0/16"
}

variable "vpc_id" {
  description = "VPC ID where the route table is created"
  type        = string
}

variable "igw_id" {
  description = "Internet Gateway ID for public route"
  type        = string
}

variable "natgw1_id" {
  description = "NAT Gateway 1 ID for private routing"
  type        = string
}

variable "natgw2_id" {
  description = "NAT Gateway 2 ID for private routing"
  type        = string
}

variable "public_subnet1_id" {
  description = "Public subnet 1 ID to associate with public route table"
  type        = string
}

variable "public_subnet2_id" {
  description = "Public subnet 2 ID to associate with public route table"
  type        = string
}

variable "private_subnet1_id" {
  description = "Private subnet 1 ID to associate with private route table"
  type        = string
}

variable "private_subnet2_id" {
  description = "Private subnet 2 ID to associate with private route table"
  type        = string
}