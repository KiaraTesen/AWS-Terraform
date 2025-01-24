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
  # Creamos 21 instancias ec2 aws idénticas
  count = 5

  ami                    = "ami-044ac00df23d47aa0"      ###### Según VM creada en EC2
  vpc_security_group_ids = ["sg-0c9235ea916a9cc7d"]     ###### Estoy usando el creado con la VPC
  iam_instance_profile   = "ec2_instance"
  instance_type          = "t3.small"                   ### instance que se puede usar en la versión gratuita - Con t2.medium FUNCIONÓ
  key_name               = "sp_kt2"                     ###### Esta key pair se crea para que haya una llave y se pueda conectar por RDP, se debe guardar muy bien el archivo porque no se recupera
  subnet_id              = "subnet-0fa530b33df51f5e4"   ### Estoy usando el creado con la VPC

  private_ip = "10.0.1.${count.index + 27}" ## CAMBIE +12 por +11
  tags = {
    Name = "windows-sp-${count.index + 17}" ## CAMBIE +2 por +1
  }
}
