variable "ami" {
  default = "ami-04505e74c0741db8d"
  type    = string
}

variable "instance_type" {
  default = "t3.medium"
}

/*variable "zone_disponibilite" {
  default = "us-east-1x"
}*/

variable "key_name" {
    default = "capge_projet_kp"
}

/*variable "sg_name" {
  default = "security_group_capge"
}*/

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
  default = "AnsibleMaster"
}

variable "private_key_path" {
  default = "D:/Formation/AJC/05.DevOps/PROJET/capge_projet_kp.pem"
}

variable "ec2_server_ip" {
  default = "0.0.0.0"
}

variable "ec2_odoo_ip" {
  default = "0.0.0.0"
}

variable "pgadmin_dns" {
  default = "pgadmin-dns.com"
}

variable "odoo_dns" {
  default = "odoo-dns.com"
}

variable "pgadmin_port" {
  default = 5050
}

variable "odoo_port" {
  default = 8069
}

output "ec2_id" {
  value = aws_instance.myec2_master.id
}