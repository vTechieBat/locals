provider "aws" {
   region     = "us-east-1"
}
locals {
  staging_env = "staging1"
}

resource "aws_instance" "ec2_example" {
   
   ami           = "ami-0fff1b9a61dec8a5f"
   instance_type = "t2.micro"
   tags = {
           Name = "${local.staging_env} - Terraform EC2"
   }
}
output "my_console_output" {
  value = aws_instance.ec2_example.public_ip
}
