resource "aws_security_group" "testing_sg" {
  vpc_id = var.vpc_id

  // Define your security group rules here
  // Example: Allow SSH access from all IPs
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["49.206.135.36/32"]
  }

  ingress {
	from_port   = 80
	to_port     = 80
	protocol    = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
  	from_port    = 443
	to_port      = 443
	protocol     = "tcp"
	cidr_blocks   = ["0.0.0.0/0"]
  }
  
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow outbound traffic to all destinations
  }

  tags = {
    Name = var.sg_name
  }
}

