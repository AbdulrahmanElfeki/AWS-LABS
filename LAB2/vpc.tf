resource "aws_vpc" "MyVPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "My Awesome VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.MyVPC.id
  cidr_block        = "10.0.10.0/24"
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

resource "aws_internet_gateway" "igw-bastion123" {
  vpc_id = aws_vpc.MyVPC.id
}

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.MyVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-bastion123.id
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route.id
}