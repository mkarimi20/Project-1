resource "aws_instance" "prod" {
  count = var.count_instance
  ami             = "${data.aws_ami.centos.image_id}"
  instance_type   = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  key_name = aws_key_pair.terraform.key_name
  security_groups = ["bastionhost"]
    lifecycle{
    prevent_destroy = false
  }
  tags = {
    Name = "prod${count.index +1}"
  }
}