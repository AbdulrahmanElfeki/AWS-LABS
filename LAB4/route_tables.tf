resource "aws_route_table" "rtb_public" {
    vpc_id = aws_vpc.MyVPC.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table" "rtb_private_1" {
    vpc_id = aws_vpc.MyVPC.id
    tags = { Name = "private route table 1" }
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id=aws_nat_gateway.public_nat_1.id
    }
}

resource "aws_route_table" "rtb_private_2" {
    vpc_id = aws_vpc.MyVPC.id
    tags = { Name = "private route table 2" }
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id=aws_nat_gateway.public_nat_2.id
    }
}

resource "aws_route_table_association" "public_association_1" {
  subnet_id      = aws_subnet.subnet_public_1.id
  route_table_id = aws_route_table.rtb_public.id
}

resource "aws_route_table_association" "public_association_2" {
  subnet_id      = aws_subnet.subnet_public_2.id
  route_table_id = aws_route_table.rtb_public.id
}


resource "aws_route_table_association" "private_association_1" {
  subnet_id      = aws_subnet.subnet_private_1.id
  route_table_id = aws_route_table.rtb_private_1.id
}

resource "aws_route_table_association" "private_association_2" {
  subnet_id      = aws_subnet.subnet_private_2.id
  route_table_id = aws_route_table.rtb_private_2.id
}