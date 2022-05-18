resource "aws_s3_bucket" "s3-dev4" {
  bucket        = "s3-dev4"
  tags          = {
    Name        = "s3-dev4"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_acl" "s3-dev-acl" {
  bucket        = aws_s3_bucket.s3-dev4.id
  acl           = "private"
}


resource "aws_s3_bucket" "s3-hom" {
  bucket        = "s3-hom"
  tags          = {
    Name        = "s3-hom"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_acl" "s3-hom-acl" {
  bucket        = aws_s3_bucket.s3-hom.id
  acl           = "private"
}