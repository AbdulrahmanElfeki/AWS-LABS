resource "aws_instance" "ec2_private" {
  count         = 2
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "prom"
  subnet_id = element([aws_subnet.subnet_private_1.id,
                       aws_subnet.subnet_private_2.id,
                      ],count.index
                    )
  tags = {
    Name = "private-instance-${count.index}"
  }
  security_groups = [ aws_security_group.ec2_security_group.id ]
  user_data = <<-EOL
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html  
  EOL
}

resource "aws_instance" "ec2_public" {
  count         = 2
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "prom"
  subnet_id = element([aws_subnet.subnet_public_1.id,
                       aws_subnet.subnet_public_2.id,
                       ],
                       count.index
                 )
  tags = {
    Name = "public-instance-${count.index}"
  }
  security_groups = [ aws_security_group.ec2_security_group.id ]
  user_data = <<-EOL
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html  
  EOL
}



