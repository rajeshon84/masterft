resource "aws_instance" "EC2Instance" {
    ami = var.ami
    count = 1
    instance_type = var.instance_type
    availability_zone = "us-east-1a"
    tenancy = "default"
    subnet_id = aws_subnet.public_subnet.id
    ebs_optimized = false
    vpc_security_group_ids = [aws_security_group.Office-sg.id]
    source_dest_check = true
    root_block_device {
        volume_size = 15
        volume_type = var.volume_type_gp2
        #delete_on_termination = true#
    }
    tags = {
      name = "EC2_instance_new"
    }
}
