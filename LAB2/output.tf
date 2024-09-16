output "public_ip" {
    description = "VM public IP"
    value= aws_instance.ec2_public.public_ip
}

output "private_ip" {
    description = "VM private IP"
    value= aws_instance.ec2_private.private_ip
}


