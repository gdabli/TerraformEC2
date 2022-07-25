provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "devEC2" {

  count         = var.total_number_of_instances
  ami           = var.ami-id
  instance_type = var.instance-type
  key_name      = var.key_name

  root_block_device {
    volume_size           = var.root_volume_size
    delete_on_termination = true
    encrypted             = true

  }

  tags = {
    Name    = "${var.instance_name}-${count.index+1}"
    project = "personal project"
  }
}
