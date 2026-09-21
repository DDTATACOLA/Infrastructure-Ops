resource "aws_instance" "web_server" {
    ami                         = "ami-00634bca710e8ccb1" # Amazon Linux 2 AMI (HVM), SSD Volume Type
    instance_type               = "t2.micro"
    associate_public_ip_address = true
#key name
    vpc_security_group_ids = [aws_security_group.web_server.id]
    subnet_id              = aws_subnet.public_eu-west-3a.id


user_data = file("user_data.sh")

    tags = {
        Name = "web-server"
    }
}
