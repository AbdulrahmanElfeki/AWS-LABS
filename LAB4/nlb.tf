resource "aws_lb" "aws-nlb" {
  name               = "aws-nlb"
  internal           = false
  load_balancer_type = "network"
  security_groups    = [aws_security_group.nlb_security_group.id]
  subnets            = [aws_subnet.subnet_public_1.id,
                        aws_subnet.subnet_public_2.id]
  enable_deletion_protection = false 
  
}


resource "aws_lb_listener" "nlb_listener_1" {
  load_balancer_arn = aws_lb.aws-nlb.arn
  port              = 8081
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target.arn
  }
}

resource "aws_lb_listener" "nlb_listener_2" {
  load_balancer_arn = aws_lb.aws-nlb.arn
  port              = 8082
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public_ecc.arn
  }
}