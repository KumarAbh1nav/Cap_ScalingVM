// Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main-vpc"
  }
}

// Output the VPC ID
output "vpc_id" {
  value = aws_vpc.main.id
}
