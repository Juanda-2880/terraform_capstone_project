variable "cidr1" {
    description = "cidr block for the first route in the route table"
    type = string
    default = "0.0.0.0/0"
  
}

variable "cidr2" {
    description = "cidr block for the second route in the route table"
    type = string
    default = "10.0.0.0/16"
}