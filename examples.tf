provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "eu-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-1b2bb774"
  instance_type = "t2.micro"
   tags {
    Product = "Clearing"
    CostCenter = "6121"
    Application = "terraform"
    
  }
}

