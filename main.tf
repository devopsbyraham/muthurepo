provider "aws" {
region = "us-east-1"
}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "my-terraform-batch-001"

    workspaces {
      name = "muthurepo"
    }
  }
}

resource "aws_instance" "three" {
  count         = 1
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"

  tags = {
    Name = "dev-server"
  }
}
