resource "aws_route_table" "testing_route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route" "internet_gateway_route" {
  route_table_id            = aws_route_table.testing_route_table.id
  destination_cidr_block    = "0.0.0.0/0"   # Route all internet traffic
  gateway_id                = var.internet_gateway_id # Use the internet gateway ID
}


