provider "aws" {   #it is plugin used for which cloud platform we are gone create
    region = "ap-south-1"  # mumbai region
}

resource "aws_vpc" "dev" {  # it is a terraform resource used to create 
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "dev"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-south-1a"  # availability zone 1a,1b,1c 
  map_public_ip_on_launch = true #by using this pubic ip will create 

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = "dev-igw"
  }
}


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.dev.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_assoc" {  #routetable la subnet connect
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}