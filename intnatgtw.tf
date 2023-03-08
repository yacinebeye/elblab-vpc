#INTERNET GTW 

resource "aws_internet_gateway" "igw2" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "elblab2-igw"
  }
}

resource "aws_eip" "nat_eip" {
  vpc = true
}

#NAT GATEWAY

resource "aws_nat_gateway" "natgtw2" {
    allocation_id = aws_eip.nat_eip.id
    connectivity_type = "public"
    subnet_id = aws_subnet.public.id

  tags = {
    Name = "elblab2-natigw"
  }
  depends_on = [aws_internet_gateway.igw2]
}

#ROUTETABLES

resource "aws_route_table" "nat_route_table2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgtw2.id
  }

  tags = {
    Name = "elb2nat-route-table"
  }
}

resource "aws_route_table" "internet_route_table2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw2.id
  }

  tags = {
    Name = "elb2internet-route-table"
  }
}

# # ASSOCIATE ROUTE TABLE -- PRIVATE LAYER
# resource "aws_route_table_association" "internet_route_table_association_private" {
#   subnet_id      = aws_subnet.private.id
#   route_table_id = aws_route_table.nat_route_table.id
# }

# ASSOCIATE ROUTE TABLE -- PUBLIC LAYER
resource "aws_route_table_association" "internet_route_table_association_public2" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.internet_route_table2.id
}