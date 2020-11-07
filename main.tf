provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/home/root/.aws/creds"
  profile                 = "terraform"
}

resource "aws_eip" "ip-staging" {
  instance = "{aws_instance.demo-ec2-instance.id}"
  vpc      = true
}

resource "aws_key_pair" "staging" {
  key_name   = "demo-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "terraform-staging" {
  ami             = "ami-0c94855ba95c71c99"
  instance_type   = "t1.micro"
  security_groups = ["default"]
  key_name        = "staging-key"
  count           = 1 # create four similar EC2 instances
  tags = {
    Name = "ec2-staging-${count.index + 1}.xpaceform.com"
  }
}
