provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "prod_instance" {
  # Creamos 3 instancias ec2 aws idénticas
  count = 2

  ami                    = "ami-02376a0533bd5adc7"
  vpc_security_group_ids = ["sg-077007c4f8682ef9e"]
  instance_type          = "t3.micro"
  subnet_id              = "subnet-05b1e56d9bccff4ba"
  private_ip = "10.0.1.${count.index + 12}"
  tags = {
    Name = "windows-lp-${count.index + 2}"
  }
}
