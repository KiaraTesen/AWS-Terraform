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
  ami                    = "ami-020cf8453b4f88780"      ###### Según VM creada en EC2
  vpc_security_group_ids = ["sg-06e1caf0e5a28d64f"]     ###### Estoy usando el creado con la VPC 
  iam_instance_profile   = "ec2_instance"
  instance_type          = "t2.large"
  key_name               = "ligua_key"                     ###### Esta key pair se crea para que haya una llave y se pueda conectar por RDP, se debe guardar muy bien el archivo porque no se recupera
  subnet_id              = "subnet-05c56af9772073f30"   ###### Estoy usando el creado con la VPC
  private_ip             = "10.0.1.11" 
  tags = {
    Name = "windows-sp-1"                               ### Nombre de la vm
  }
}