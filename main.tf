provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "devEC2" {

  count         = var.total_number_of_instances
  ami           = var.ami-id
  vpc_security_group_ids = [aws_security_group.sg-webserver.id]
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

resource "aws_security_group" "sg-webserver"{
  vpc_id = var.vpc
  name = "webserverSG"
  description = "Security Group for WB"  

  dynamic "ingress" {
    for_each = var.tcp_inbound_ports
    content{
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }

  dynamic "egress" {
    for_each = var.tcp_outbound_ports
    content{
      from_port = egress.value
      to_port = egress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }

}