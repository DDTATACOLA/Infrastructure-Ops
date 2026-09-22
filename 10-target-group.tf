resource "aws_lb_target_group" "web_tier" {
    name     = "web-tier-server-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.agol.id

  # default value but nice to actually see it explictly 
  health_check {
    enabled = true
    healthy_threshold   = 2
  }
  tags = {
    Name = "web-tier-server-tg"
}
}