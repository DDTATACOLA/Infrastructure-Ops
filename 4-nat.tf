# Elastic IP for NAT Gateway
# NAT gateway needs a static public IP address
resource "aws_eip" "agol-nat" {
  domain = "vpc"

  tags = {
    Name = "agol-nat-eip"
  }

  depends_on = [aws_internet_gateway.igw]
}

# NAT Gateway
# Allows resources in private subnets to reach the internet
# but prevents the internet from initiating connections to them
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.agol-nat.id
  subnet_id     = aws_subnet.public_eu-west-3a.id

  tags = {
    Name = "agol-nat-gateway"
  }

  depends_on = [aws_internet_gateway.igw]
}