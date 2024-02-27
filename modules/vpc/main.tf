resource "aws_vpc" "testing_vpc" {
  cidr_block = "172.31.0.0/16"
  tags = {
    Name = var.vpc_name
  }
}
