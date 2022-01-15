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

  /*provisioner "remote-exec" {
      inline = [
        "sudo apt-get update -y"
      ]

      connection {
          type = "ssh"
          user = var.username
          private_key = file("${var.private_key_path}")
          host = self.public_ip
      }
  }*/

  /*provisioner "local-exec" {
      command = "echo capge-${var.env}-${var.serveur} : ${self.public_ip} >> ip_ec2.txt"
  }*/

}