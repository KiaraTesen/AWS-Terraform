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
  count = 1

  ami                    = "ami-05515e3ac88c6e991"      ###### Según VM creada en EC2
  vpc_security_group_ids = ["sg-06e1caf0e5a28d64f"]     ###### Estoy usando el creado con la VPC
  iam_instance_profile   = "ec2_instance"
  instance_type          = "t2.medium"                  ### instance que se puede usar en la versión gratuita - Con t2.medium FUNCIONÓ
  key_name               = "ligua_key"                  ###### Esta key pair se crea para que haya una llave y se pueda conectar por RDP, se debe guardar muy bien el archivo porque no se recupera
  subnet_id              = "subnet-05c56af9772073f30"   ### Estoy usando el creado con la VPC

  private_ip = "10.0.1.${count.index + 12}" ## CAMBIE +12 por +11
  tags = {
    Name = "windows-sp-${count.index + 2}" ## CAMBIE +2 por +1
  }
}
