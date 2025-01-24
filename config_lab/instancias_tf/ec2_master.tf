provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "prod_instance" {
  ami                    = "ami-0afb9eb61f5aa0b47"
  vpc_security_group_ids = ["sg-077007c4f8682ef9e"]
  instance_type          = "t2.micro"
  subnet_id              = "subnet-05b1e56d9bccff4ba"
  private_ip = "10.0.1.11"
  tags = {
    Name = "windows-lp-1"
  }
}
