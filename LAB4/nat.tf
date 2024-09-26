resource "aws_nat_gateway" "public_nat_1" {
  subnet_id     = aws_subnet.subnet_public_1.id
  allocation_id = aws_eip.eip_1a.id
  tags = {
    Name = "public NAT 1"
  }
}

resource "aws_nat_gateway" "public_nat_2" {
  subnet_id     = aws_subnet.subnet_public_1.id
  allocation_id = aws_eip.eip_1b.id
  tags = {
    Name = "public NAT 2"
  }
}