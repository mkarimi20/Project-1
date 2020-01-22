resource "aws_instance" "prod" {
  count = var.count_instance
  ami = ami-0d20c23f760937ee7 #"${data.aws_ami.centos.image_id}"
  instance_type   = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  key_name = aws_key_pair.terraform.key_name
  security_groups = ["bastionhost"]
  provisioner "remote-exec" {
    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = var.user
      private_key = file(var.ssh_key_location)
      }
      inline = [
        "sudo yum install -y epel-release",
        "sudo yum install httpd -y ",
        "sudo systemctl start httpd",
        ]
      }
    lifecycle{
    prevent_destroy = false
  }
  tags = {
    Name = "prod${count.index +1}"
  }
}