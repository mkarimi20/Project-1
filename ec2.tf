resource "aws_instance" "prod" {
  count = var.count_instance
  ami             = "${data.aws_ami.centos.image_id}"
  instance_type   = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  key_name = var.key_name
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
        #"sudo yum install httpd -y ",
        #"sudo systemctl start httpd",
        #"sudo systemctl enable httpd",
        #]
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

data "aws_ami" "centos" {
  most_recent = true
  owners      = ["aws-marketplace"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "image-type"
    values = ["machine"]
  }

  filter {
    name   = "name"
    values = ["CentOS Linux 7*"]
  }
}