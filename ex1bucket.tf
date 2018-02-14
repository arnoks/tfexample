resource "aws_s3_bucket" "ex1bucket" {
  bucket = "clearing-vn401-terraform-e1"
  acl    = "private"
}


resource "aws_sqs_queue" "some_sqs_squeue" {
  name = "clearing-vn401-input-eventq"
  tags {
    Costcenter = "6121"
    Product = "Clearing",
  }
}
