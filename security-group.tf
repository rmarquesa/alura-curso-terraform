resource "aws_security_group" "acesso_ssh" {
  name          = "acesso_ssh"
  description   = "acesso_ssh"

  # to do pesquisar
  # vpc_id      = aws_vpc.main.id

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
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags  = {
    Name  = "ssh"
  }
}