resource "aws_subnet" "subnet_private_1" {
  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = "10.0.128.0/24"
  availability_zone       = "us-east-1a"
}

resource "aws_subnet" "subnet_private_2" {
  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = "10.0.144.0/20"
  availability_zone       = "us-east-1b"
}

# Create a second subnet in each AZ
resource "aws_subnet" "subnet_public_1" {
  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = "10.0.0.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_public_2" {
  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = "10.0.16.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
}