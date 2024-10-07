provider "aws" {
   region     = "eu-central-1"
   access_key = "<YOUR_AWS_ACCESS_KEY>"
   secret_key = "<YOUR_AWS_SECRET_KEY>"
}
locals {
  staging_env = "staging"
}

resource "aws_instance" "ec2_example" {
   
   ami           = "ami-0767046d1677be5a0"
   instance_type = "t2.micro"
   subnet_id = aws_subnet.staging-subnet.id
   
   tags = {
           Name = "${local.staging_env} - Terraform EC2"
   }
}