terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.14.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "dev" {
  # Ubuntu Server 20.04 LTS - 1GB RAM - Free Tier
  ami = "ami-0c4f7023847b90238"
  instance_type = "t2.micro"
  key_name = "terraform-aws"

  # Qtd instances
  count = 3
  tags = {
    "Name" = "dev${count.index}"
  }
  vpc_security_group_ids = ["sg-01c3ed7430deb2249","sg-075f9c906a29a4ce8"]
}

resource "aws_security_group" "acesso_ssh" {
  name        = "acesso_ssh"
  description = "acesso_ssh"

  # to do pesquisar
  # vpc_id      = aws_vpc.main.id

  ingress {
    description      = "acesso_ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["177.62.157.192/32"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh"
  }
}