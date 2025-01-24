# This is a comment
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-03cd80cfebcbb4481"
  instance_type = "t2.micro"
}
output "public_ip" {
  value = aws_instance.example.public_ip
}

