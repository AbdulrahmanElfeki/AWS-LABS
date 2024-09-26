resource "aws_lb_target_group" "public_ecc" {
  name     = "PUBLIC-ECC"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.MyVPC.id
}

resource "aws_lb_target_group_attachment" "public_instance_1_attach" {
  target_group_arn = aws_lb_target_group.public_ecc.arn
  target_id        = aws_instance.ec2_public[0].id
  port             = 80
}

resource "aws_lb_target_group_attachment" "public_instance_2_attach" {
  target_group_arn = aws_lb_target_group.public_ecc.arn
  target_id        = aws_instance.ec2_public[1].id
  port             = 80
}

resource "aws_lb_target_group" "private_ecc" {
  name     = "PRIVATE-ECC"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.MyVPC.id
}

resource "aws_lb_target_group_attachment" "private_instance_1_attach" {
  target_group_arn = aws_lb_target_group.private_ecc.arn
  target_id        = aws_instance.ec2_private[0].id
  port             = 80
}

resource "aws_lb_target_group_attachment" "private_instance_2_attach" {
  target_group_arn = aws_lb_target_group.private_ecc.arn
  target_id        = aws_instance.ec2_private[1].id
  port             = 80
}

resource "aws_lb_target_group" "alb_target" {
  name        = "ALB-TARGET"
  target_type = "alb"
  port        = 80
  protocol    = "TCP"
  vpc_id      = aws_vpc.MyVPC.id
}

resource "aws_lb_target_group_attachment" "alb_target_attach" {
  target_group_arn = aws_lb_target_group.alb_target.arn
  target_id        = aws_lb.aws_alb.id
  port             = aws_lb_listener.alb-listener.port
}





