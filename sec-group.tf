resource "aws_security_group" "bastion" { 
  name        = "bastion" 
  description = "Allow TLS inbound traffic" 
  vpc_id      = "vpc-908caaf6" 

  ingress { 
    from_port   = 22
    to_port     = 22 
    protocol    = "tcp" 
    cidr_blocks = ["0.0.0.0/0"]   

} 

    ingress { 
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp" 
    cidr_blocks = ["0.0.0.0/0"]   

} 
} 