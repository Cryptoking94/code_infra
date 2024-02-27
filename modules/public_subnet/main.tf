resource "aws_subnet" "testing_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet_name
  }
}

resource "aws_route_table_association" "testing_subnet_association" {
  subnet_id      = aws_subnet.testing_subnet.id
  route_table_id = var.route_table_id
}

