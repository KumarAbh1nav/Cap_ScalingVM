
// Create an Internet Gateway

resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id
  tags = {
    Name = "main-igw"
  }
}

// Output the Internet Gateway ID

output "gateway_id" {
  value = aws_internet_gateway.main.id
}

