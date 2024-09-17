resource "aws_vpc" "MyVPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "My Awesome VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.MyVPC.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags =  {
    Name = "public subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.MyVPC.id
  cidr_block        = "10.0.100.0/24"
  availability_zone = "us-east-1a"
  tags =  {
    Name = "private subnet"
  }
}


# Configure eip resource
resource  "aws_eip" "my-eip"{
     domain   = "vpc"
}


resource "aws_internet_gateway" "igw-bastion123" {
  vpc_id = aws_vpc.MyVPC.id
  tags = { Name= "igw-bastion123" }
}


resource "aws_nat_gateway" "public_nat" {
  subnet_id     = aws_subnet.public_subnet.id
  allocation_id = aws_eip.my-eip.id
  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.igw-bastion123]
}

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.MyVPC.id
   tags = { Name = "public route table" }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-bastion123.id
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.MyVPC.id
  tags = { Name = "private route table" }
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id=aws_nat_gateway.public_nat.id
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route.id
}
