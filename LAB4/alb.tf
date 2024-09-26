resource "aws_lb" "aws_alb" {
  name               = "aws-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_security_group.id]
  subnets            = [aws_subnet.subnet_private_1.id,
                        aws_subnet.subnet_private_2.id]
  enable_deletion_protection = false  
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.aws_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private_ecc.arn
  }
}