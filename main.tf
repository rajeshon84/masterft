# VPC ID creation
resource "aws_vpc" "vpc_test1" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "vpc_test1"
  }
}
# Subnet Mask Creation
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc_test1.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "VPC_test1_subnet"
  }
}

# Internet gateway Creation
resource "aws_internet_gateway" "test_gateway" {
  vpc_id = aws_vpc.vpc_test1.id

  tags = {
    Name = "test_gateway_tag"
  }
}

# Route table creation
resource "aws_route_table" "Public_route1" {
  vpc_id = aws_vpc.vpc_test1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_gateway.id
  }

  tags = {
    Name = "IGT"
  }
}

resource "aws_route_table_association" "public_sub" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.Public_route1.id
}

# Security Group #
resource "aws_security_group" "Office-sg" {
  vpc_id          = aws_vpc.vpc_test1.id
  name        = "security group"
  description = "Security Group for testing"

  dynamic "ingress" {
    for_each = [22,80,443,]
    iterator = port

    content  {
      description = "Inbound Sec Permission"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
     for_each = [22,80,443,]
    content {
      description = "Outbound Sec Permission"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }
}


# resource "aws_instance" "aws_EC2" {
# ami = "ami-0c9978668f8d55984"
# instance_type = "t2.micro"
# vpc_id = "vpc-0acb2600b2c4efd68"
# subnet_id = "subnet-01d82e6e21f1e97a0"
# availability_zone = "us-east-1a"
# vpc_security_group_ids = "vpc-0acb2600b2c4efd68"
# tenancy = "default"

# tags = {
#     Name = "terrafrom_ec2"
#     }
# } 