resource "aws_eip_association" "testing_eip_association" {
	 instance_id   = var.instance_id
         allocation_id = var.eip_id
}
