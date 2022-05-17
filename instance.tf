resource "aws_instance" "dev" {
  # Ubuntu Server 20.04 LTS - 1GB RAM - Free Tier
  ami           = "ami-0c4f7023847b90238"
  instance_type = "t2.micro"
  key_name      = "terraform-aws"

  # Qtd instances
  count         = 3
  tags          = {"Name" = "dev${count.index}"}
  vpc_security_group_ids = [aws_security_group.acesso_ssh.id]
}

resource "aws_instance" "dev4" {
  # Ubuntu Server 20.04 LTS - 1GB RAM - Free Tier
  ami           = "ami-0c4f7023847b90238"
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  tags          = {"Name" = "dev4"}
  depends_on    = [aws_s3_bucket.s3-dev4]
  vpc_security_group_ids  = [aws_security_group.acesso_ssh.id]

}

resource "aws_instance" "dev5" {
  # Ubuntu Server 20.04 LTS - 1GB RAM - Free Tier
  ami           = "ami-0c4f7023847b90238"
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  tags          = {"Name" = "dev5"}
  vpc_security_group_ids = [aws_security_group.acesso_ssh.id]
}