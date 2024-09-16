resource "aws_instance" "ec2_public" {
  ami           = "ami-06c68f701d8090592"
  instance_type = "t2.micro"

  tags = {
    Name = "ec2_public"
  }
  key_name = ""
  availability_zone = "us-east-1a"
  subnet_id     = aws_subnet.public_subnet.id
  associate_public_ip_address = true
}

resource "aws_instance" "ec2_private" {
  ami           = "ami-06c68f701d8090592"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  key_name = ""
  subnet_id     = aws_subnet.private_subnet.id
  tags = {
    Name = "ec2_private"
  }
}

resource "aws_security_group" "ec2_security_group" {
  name        = "Host security group"
  description = "My custom security group"
  tags = {
    Name = "ec2_security_group"
  }
  ingress {
    from_port = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All protocols
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }
}
