output "ec2_instance_public_ip" {
  value = aws_instance.ec2_public[*].public_ip
}

output "nlb_dns_name" {
  value = aws_lb.aws-nlb.dns_name
  
}