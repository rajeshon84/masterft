variable "vpc_cidr_block" {
  description = "vpc cidr block range"
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    default =  "10.0.2.0/24"
    description = "vpc name desc"
    type = string
}
variable "ami" {
    default = "ami-0c9978668f8d55984"
    description = "AMI t2.micro"
    type = string
   
}

variable "instance_type" {
    default = "t2.micro"
    description = "AMI t2.micro"
    type = string
  
}

variable "ami_ubuntu" {
    default = "ami-0557a15b87f6559cf"
    description = "AMI t2.micro Ubuntu"
    type = string
  
}
variable "volume_type_gp2" {
    default = "gp2"
    description = "volume_type_ec2"
    type = string
  
}


