#SUBNETS

# #PRIVATE SUBNET
# resource "aws_subnet" "private" {
#     vpc_id = aws_vpc.main.id
#     cidr_block = "192.168.1.0/24"
#     availability_zone = "us-east-1a"
#     map_public_ip_on_launch = true

#     tags = {
#         Name = "elblab2-private-a"
#     }
# }

#PUBLIC SUBNET
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.2.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
        Name = "elblab2-public-a"
    }
}

#PUBLIC SUBNET
resource "aws_subnet" "public1b" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.3.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true

    tags = {
        Name = "elblab2-public-b"
    }
}

#PUBLIC SUBNET
resource "aws_subnet" "public1c" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.4.0/24"
    availability_zone = "us-east-1c"
    map_public_ip_on_launch = true

    tags = {
        Name = "elblab2-public-c"
    }
}