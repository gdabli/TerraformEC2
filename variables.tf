variable "ami-id" {
  type        = string
  default     = "ami-08df646e18b182346"
  description = "amazon machine image used to create the instance"
}
variable "instance-type" {
  type        = string
  default     = "t2.micro"
  description = "size of instance used"
}

variable "total_number_of_instances" {
  type        = number
  default     = 1
  description = "total number of ec2 instances to be created"
}

variable "instance_name" {
  type        = string
  default     = "DevEC2"
  description = "Name of EC2 instances"
}

variable "root_block_device" {
  description = "Customize details about the root block device of the instance. See Block Devices below for details"
  type        = list(any)
  default     = []
}

variable "root_volume_size" {
  description = "Root volume size"
  type        = string
  default     = "10"
}

variable "key_name" {
  type        = string
  default     = "test-ec2-key"
  description = "description"
}

variable "vpc" {
  type = string
  description = "name of the vpc to be given"
  default = "vpc-0fec54236ac31e647"

}

variable "tcp_inbound_ports" {
  type = list(number)
  description = "Inbound ports for EC2 instance"
  default = [22, 80, 443]
}

variable "tcp_outbound_ports" {
  type = list(number)
  description = "OutBound ports for EC2 instance"
  default = [80, 443]
}

variable "ssh" {
  type = number
  description = "(optional) describe your variable"
  default = 22
}
