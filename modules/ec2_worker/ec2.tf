resource "aws_instance" "myec2_worker" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = var.sg_group
  //availability_zone = var.zone_disponibilite

  root_block_device {
    delete_on_termination = true
  }
  
  tags = {
    Name      = "capge-${var.env}-${var.serveur}"
    formation = "Frazer"
    iac       = "terraform"
  }

}