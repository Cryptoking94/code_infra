variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "ami" {
  description = "AMI for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "security_group_ids" {
  description = "IDs of security groups"
  type        = list(string)
}

variable "key_pair_name" {
  description = "Name of the existing key pair"
  type        = string
}
