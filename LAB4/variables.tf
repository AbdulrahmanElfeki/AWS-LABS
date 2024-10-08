# Create two availability zones (AZs)
variable "availability_zones" {
  type    = list(string)
  default = ["us-west-1a", "us-west-1b"]
}

variable "ami" {
    description= "to define the ami of ec2 instance"
    type= string 
}

variable "instance_type" {
    description= "to define the instance_type of ec2 instance"
    type= string 
}
