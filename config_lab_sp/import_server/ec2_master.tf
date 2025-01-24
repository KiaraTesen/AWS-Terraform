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
  ami                    = "ami-0d534d3194678cb73"      ### Según VM creada en EC2
  vpc_security_group_ids = ["sg-068b30b2191752a95"]     ### Estoy usando el creado con la VPC
  iam_instance_profile   = "ec2_instance"
  instance_type          = "t2.medium"                  ### instance que se puede usar en la versión gratuita
  key_name               = "ec2_test"                   ### Esta key pair se crea para que haya una llave y se pueda conectar por RDP, se debe guardar muy bien el archivo porque no se recupera
  subnet_id              = "subnet-01c90e5700e225881"   ### Estoy usando el creado con la VPC
  private_ip             = "10.0.1.11"                  ### No funciona "10.0.0.11"
  tags = {
    Name = "windows-sp-2"                               ### Nombre de la vm
  }
}


