# for ASG EC2 instances

resource "aws_security_group" "web_server" {
  name        = "web-server-sg"
  description = "Allow inbound HTTP and SSH for web apps in web tier"
  vpc_id      = aws_vpc.agol.id
  # <resource type>.<resource local name>.<attribute type> 

  tags = {
    Name = "web-server-sg"
    Tier = "web"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web_server_http" {
  security_group_id = aws_security_group.web_server.id
  # ALB SG ID goes here (ALB is the source of HTTP traffic for web apps)
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "web_server_ssh" {
  security_group_id = aws_security_group.web_server.id
  cidr_ipv4         = "10.10.0.0/16" # only allow SSH from within the VPC
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "web_server_egress" {
  security_group_id = aws_security_group.web_server.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
