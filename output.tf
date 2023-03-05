output "vpc_name1" {
    value = aws_vpc.vpc_test1.id
}

output "public_subnet1" {
    value = aws_subnet.public_subnet.id
}