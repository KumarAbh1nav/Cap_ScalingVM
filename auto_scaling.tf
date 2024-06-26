// Create a Launch Configuration
resource "aws_launch_configuration" "aws_launch_conf" {
  name          = "auto_launch_configuration"
  image_id      = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}

// Create an Auto Scaling Group
resource "aws_autoscaling_group" "mygroup" {
  launch_configuration = aws_launch_configuration.aws_launch_conf.id
  vpc_zone_identifier  = var.subnet_ids
  min_size             = 1
  max_size             = 3
  desired_capacity     = 1

  tags = [
    {
      key                 = "Name"
      value               = "example-instance"
      propagate_at_launch = true
    },
  ]
}

