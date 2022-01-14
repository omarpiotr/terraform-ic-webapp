variable "sg_name" {
  default = "capge-sg-dev"
}

output "sg_name" {
  value = aws_security_group.web-sg.name
}