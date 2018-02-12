provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "eu-central-1"
}

resource "aws_security_group" "StandardSecurity" {
  name = "default"
}

resource "aws_instance" "example" {
  ami           = "ami-1b2bb774"
  instance_type = "t2.micro"
  key_name      = "clearing-vn401-sbox-euc1"

  tags {
    Product     = "Clearing"
    CostCenter  = "6121"
    Application = "terraform"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.log"
  }

  depends_on = ["aws_s3_bucket.ex1bucket"]
}

# Assign an Elastic Address to the instance

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}
