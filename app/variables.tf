variable "key_path" {
  default = "D:/Formation/AJC/05.DevOps/PROJET/capge_projet_kp.pem"
}

variable "key_name" {
  default = "capge_projet_kp"
}

variable "odoo_port" {
  default = 8069
}

variable "pgadmin_port" {
  default = 5050
}

variable "ic-webapp_image" {
  default = "lianhuahayu/ic-webapp:1.0"
}

variable "odoo_image" {
  default = "odoo:13.0"
}

variable "postgres_image" {
  default = "postgres:10"
}