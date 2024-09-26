resource "aws_security_group" "ec2_security_group" {
  vpc_id      = aws_vpc.MyVPC.id
  name        = "WebSecGrp"
  description = "My custom security group"
  tags = {
    Name = "WebSecGrp"
  }
  ingress {
    from_port = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  ingress {
    from_port = 80
    to_port     = 80
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

resource "aws_security_group" "nlb_security_group" {
  vpc_id      = aws_vpc.MyVPC.id
  name        = "NLBSecGrp"
  description = "My custom security group"
  tags = {
    Name = "NLBSecGrp"
  }
  ingress {
    from_port = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  ingress {
    from_port = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  ingress {
    from_port = 8082
    to_port     = 8082
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

resource "aws_security_group" "alb_security_group" {
  vpc_id      = aws_vpc.MyVPC.id
  name        = "ALBSecGrp"
  description = "My custom security group"
  tags = {
    Name = "ALBSecGrp"
  }
  ingress {
    from_port = 80
    to_port     = 80
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

