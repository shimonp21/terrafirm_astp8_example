terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-southeast-1"
}

resource "aws_network_interface" "interface1" {
  subnet_id = "subnet-07e2b8a532f437c58"
}

resource "aws_instance" "app_server" {
  ami           = "ami-04c913012f8977029"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.interface1.id
    device_index         = 0
  }
}

resource "aws_network_interface" "interface2" {
  subnet_id = "subnet-07e2b8a532f437c58"
}

resource "aws_instance" "app_server_2" {
  ami           = "ami-04c913012f8977029"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.interface2.id
    device_index         = 0
  }
}

resource "aws_network_interface" "interface3" {
  subnet_id = "subnet-07e2b8a532f437c58"
}

resource "aws_instance" "app_server_3" {
  ami           = "ami-04c913012f8977029"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.interface3.id
    device_index         = 0
  }
}