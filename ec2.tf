resource "aws_instance" "prod-instance" {
  count = var.count_instance
  ami             = var.ami
  instance_type   = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  key_name = aws_key_pair.mkarimi.key_name
  security_groups = ["bastion-allow"]
  provisioner "remote-exec" {
    connection {
      host = self.public_ip
      type = "ssh"
      user = var.user
      private_key = file(var.ssh_key_location)
      }
      inline = [
        "sudo yum install -y epel-release",
        "sudo yum install httpd -y ",
        "sudo systemctl start httpd",
        "sudo systemctl enable httpd",
        ]
      }
  provisioner "local-exec" {
    command = "echo Hello >> /tmp/file_hello"
  }
  lifecycle{
    prevent_destroy = false
  }
  tags = {
    Name = "prod${count.index +1}"
  }
}