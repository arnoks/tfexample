provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "eu-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-1b2bb774"
  instance_type = "t2.micro"
  key_name = "clearing-vn401-sbox-euc1"
  tags {
    Product = "Clearing"
    CostCenter = "6121"
    Application = "terraform"
  }
  depends_on = [ "aws_s3_bucket.ex1bucket" ]
}

resource "aws_instance" "another" {
  # Latest Amazon AMI V2
  ami           = "ami-1b2bb774"
  instance_type = "t2.micro"
  key_name = "clearing-vn401-sbox-euc1"
  tags {
    Product = "Clearing"
    CostCenter = "6121"
    Application = "terraform"
  }
}


# Assign an Elastic Address to the instance

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}
