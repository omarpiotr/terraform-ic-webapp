resource "aws_instance" "myec2_master" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = var.sg_group

  root_block_device {
    delete_on_termination = true
  }
  
  tags = {
    Name      = "capge-${var.env}-${var.serveur}"
    formation = "Frazer"
    iac       = "terraform"
  }

  provisioner "file" {
    source      = var.private_key_path
    destination = "/home/ubuntu/.ssh/capge_projet_kp.pem"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 15",
      "sudo apt-get update -y",
      "sleep 5",
      "chmod 400 /home/ubuntu/.ssh/capge_projet_kp.pem",
      "sudo apt-get install ansible -y",
      "sudo apt-get install sshpass -y",
      "mkdir ansible-deploy",
      "git clone https://github.com/omarpiotr/ansible_deploy_ic-webapp.git ./ansible-deploy",
      "cd ./ansible-deploy",
      "ansible-galaxy install -r roles/requirements.yml",
      "ansible-playbook -i hosts.yml playbook_odoo.yml -e ansible_connection='ssh' \\",
        "-e ansible_host='${var.ec2_odoo_ip}' \\",
        "-e postgres_image='${var.postgres_image}' \\",
        "-e odoo_image='${var.odoo_image}' \\",
        "--private-key '/home/ubuntu/.ssh/capge_projet_kp.pem'",
      "ansible-playbook -i hosts.yml playbook_pgadmin.yml -e ansible_connection='ssh' \\",
        "-e ansible_host='${var.ec2_server_ip}' \\",
        "-e host_db='${var.ec2_odoo_ip}' \\",
        "--private-key '/home/ubuntu/.ssh/capge_projet_kp.pem'",
      "ansible-playbook -i hosts.yml playbook_ic-webapp.yml -e ansible_connection='ssh' \\",
        "-e ansible_host='${var.ec2_server_ip}' \\",
        "-e odoo_url='http://${var.odoo_dns}:${var.odoo_port}' \\",
        "-e pgadmin_url='http://${var.pgadmin_dns}:${var.pgadmin_port}' \\",
        "-e ic_webapp_image='${var.ic-webapp_image}' \\",
        "--private-key '/home/ubuntu/.ssh/capge_projet_kp.pem'"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  provisioner "local-exec" {
      command = "echo vitrine : ${var.pgadmin_dns} - pgadmin:${var.ec2_server_ip}:5050 - odoo:${var.ec2_odoo_ip}:8069 > ip_ec2.txt"
  }

}