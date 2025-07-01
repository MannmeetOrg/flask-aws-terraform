# VPC Module
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id  # ✅ Must point to your custom VPC
  cidr_block = var.subnet_cidr_block
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  depends_on = [aws_vpc.main]

  tags = {
    Name = "IGW"
  }
}
resource "aws_route_table" "flask-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"    #
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "flask-rt"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.flask-rt.id
}