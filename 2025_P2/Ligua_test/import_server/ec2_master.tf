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
  ami                    = "ami-08aa4f33bd8688bc4"      ###### Según VM creada en EC2
  vpc_security_group_ids = ["sg-06e1caf0e5a28d64f"]     ###### Estoy usando el creado con la VPC  -  vpc-06c05b752c3c29fdd
  iam_instance_profile   = "ec2_instance"
  instance_type          = "t2.medium"
  key_name               = "ligua_key"                     ###### Esta key pair se crea para que haya una llave y se pueda conectar por RDP, se debe guardar muy bien el archivo porque no se recupera
  subnet_id              = "subnet-05c56af9772073f30"   ###### Estoy usando el creado con la VPC
  private_ip             = "10.0.1.11" 
  tags = {
    Name = "windows-sp-1"                               ### Nombre de la vm
  }
}