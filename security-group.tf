resource "aws_security_group" "acesso_ssh_us_east_1" {
  provider      = aws.us-east-1
  name          = "acesso_ssh"
  description   = "acesso_ssh"

  # to do pesquisar
  # vpc_id      = aws_vpc.main.id
  lifecycle { 
    create_before_destroy = true 
  }

  ingress {
    description = "acesso_ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["177.62.157.192/32"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags  = {
    Name  = "ssh"
  }
}

resource "aws_security_group" "acesso_ssh_us_east_2" {
  provider      = aws.us-east-2
  name          = "acesso_ssh"
  description   = "acesso_ssh"

  # to do pesquisar
  # vpc_id      = aws_vpc.main.id
  lifecycle { 
    create_before_destroy = true 
  }

  ingress {
    description = "acesso_ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["177.62.157.192/32"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags  = {
    Name  = "ssh"
  }

  
}