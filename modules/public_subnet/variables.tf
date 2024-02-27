variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
}

variable "route_table_id" {
  description = "ID of the route table associated with the subnet"
  type        = string
}

