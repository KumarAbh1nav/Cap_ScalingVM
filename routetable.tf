
// Create a Route Table

resource "aws_route_table" "public" {
  vpc_id = var.main.id
  tags = {
    Name = "public-route-table"
  }
}

// Create a Route for Internet Access

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.gateway_id
}

// Output the routetable

output "route_table_id" {
  value = aws_route_table.public.id
}
