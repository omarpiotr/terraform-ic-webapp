variable "ami" {
  default = "ami-04505e74c0741db8d"
  type    = string
}

variable "instance_type" {
  default = "t2.micro"
}

/*variable "zone_disponibilite" {
  default = "us-east-1x"
}*/

variable "key_name" {
    default = "capge_projet_kp"
}

variable "sg_name" {
  default = "security_group_capge"
}

variable "sg_group" {
  type = list(string)
  default = ["security_group_capge"]
}

variable "username"{
    default = "ubuntu"
}

variable "env" {
  default = "dev"
}

variable "serveur" {
  default = "admin"
}

variable "private_key_path" {
  default = "D:/Formation/AJC/05.DevOps/PROJET/capge_projet_kp.pem"
}

output "ec2_id" {
  value = aws_instance.myec2_worker.id
}

output "ec2_ip" {
  value = aws_instance.myec2_worker.public_ip
}