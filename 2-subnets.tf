# Public Subnets
# These subnets have direct internet access via the internet gateway

resource "aws_subnet" "public_eu-west-3a" {
  vpc_id                  = aws_vpc.agol.id
  cidr_block              = "10.87.1.0/24"
  availability_zone       = "eu-west-3a"
  map_public_ip_on_launch = true

  tags = {
    Name = "agol-public-subnet-1a"
    Type = "Public"
  }
}

resource "aws_subnet" "public_eu-west-3b" {
  vpc_id                  = aws_vpc.agol.id
  cidr_block              = "10.87.2.0/24"
  availability_zone       = "eu-west-3b"
  map_public_ip_on_launch = true

  tags = {
    Name = "agol-public-subnet-2b"
    Type = "Public"
  }
}

resource "aws_subnet" "public_eu-west-3c" {
  vpc_id                  = aws_vpc.agol.id
  cidr_block              = "10.87.3.0/24"
  availability_zone       = "eu-west-3c"
  map_public_ip_on_launch = true

  tags = {
    Name = "agol-public-subnet-3c"
    Type = "Public"
  }
}

# Private Subnets
# These subnets do not have direct internet access
# They can reach the internet through the NAT gateway

resource "aws_subnet" "private_eu-west-3a" {
  vpc_id            = aws_vpc.agol.id
  cidr_block        = "10.87.11.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "agol-private-subnet-1a"
    Type = "Private"
  }
}

resource "aws_subnet" "private_eu-west-3b" {
  vpc_id            = aws_vpc.agol.id
  cidr_block        = "10.87.12.0/24"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "agol-private-subnet-2b"
    Type = "Private"
  }
}

resource "aws_subnet" "private_eu-west-3c" {
  vpc_id            = aws_vpc.agol.id
  cidr_block        = "10.87.13.0/24"
  availability_zone = "eu-west-3c"

  tags = {
    Name = "agol-private-subnet-3c"
    Type = "Private"
  }
}