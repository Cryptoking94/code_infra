resource "aws_instance" "testing_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  associate_public_ip_address = true
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids  # Use vpc_security_group_ids instead of security_group_ids
  key_name               = var.key_pair_name
}

output "public_ip" {
  value = aws_instance.testing_instance.public_ip
}

