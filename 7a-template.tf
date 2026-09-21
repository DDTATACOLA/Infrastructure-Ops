resource "aws_launch_template" "web_tier" {
    name        = "web-tier-template"
    image_id      = "ami-00634bca710e8ccb1" # Amazon Linux 2 AMI (HVM), SSD Volume Type
    instance_type = "t2.micro"
    description = "Launch template for web tier EC2 instances"
    vpc_security_group_ids = [aws_security_group.web_server.id]

    user_data = filebase64("user_data.sh")
    
    tag_specifications {
        resource_type = "instance"
        tags = {
            Name = "web-tier-server-template"
            ManagedBy = "terraform"
        }
    }

}