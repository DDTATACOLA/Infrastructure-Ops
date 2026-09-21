# Internet Gateway
# Allows resources in public subnets to access the internet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.agol.id

  tags = {
    Name = "agol-igw"
  }
}