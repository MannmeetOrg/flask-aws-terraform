# VPC Module
resource "aws_vpc" "main" {
  cidr_block = var.vpc_id
  vpc_id   = var.vpc_id

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.vpc_id

  tags = {
    Name = "Main"
  }
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
    cidr_block = var.vpc_id
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "flask-rt"
  }
}
resource "aws_route_table_association" "associate_main_rt" {
  subnet_id      = aws_subnet.main.id
  gateway_id     = aws_internet_gateway.igw.id
  route_table_id = aws_route_table.flask-rt.id
}