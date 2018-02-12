resource "aws_s3_bucket" "ex1bucket" {
  bucket = "clearing-vn401-terraform-e1"
  acl    = "private"
}
