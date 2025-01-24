terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "prod_instance" {
  ami                    = "ami-044ac00df23d47aa0"      ###### Según VM creada en EC2
  vpc_security_group_ids = ["sg-0c9235ea916a9cc7d"]     ###### Estoy usando el creado con la VPC  -  vpc-06c05b752c3c29fdd
  iam_instance_profile   = "ec2_instance"
  instance_type          = "t2.medium"
  key_name               = "sp_kt2"                     ###### Esta key pair se crea para que haya una llave y se pueda conectar por RDP, se debe guardar muy bien el archivo porque no se recupera
  subnet_id              = "subnet-0fa530b33df51f5e4"   ###### Estoy usando el creado con la VPC
  private_ip             = "10.0.1.11" 
  tags = {
    Name = "windows-sp-1"                               ### Nombre de la vm
  }
}