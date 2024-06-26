// Variable for VPC ID
variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

// Variable for Public Subnet IDs
variable "subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}
