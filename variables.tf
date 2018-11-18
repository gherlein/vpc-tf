variable "aws_region" {
  description = "Region for the VPC"
  default = "us-west-2"
}

variable "aws_zone" {
  description = "Zone for the VPC"
  default = "us-west-2a"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}

variable "public_subnet_webip" {
  description = "Web Server Private IP address"
  default = "10.0.1.10"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default = "10.0.2.0/24"
}

variable "ami" {
  description = "AMI for EC2"
  default = "ami-0bbe6b35405ecebdb"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "/home/gherlein/.ssh/id_rsa.pub"
}
