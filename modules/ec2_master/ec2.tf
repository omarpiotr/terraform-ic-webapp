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

   provisioner "remote-exec" {
    inline = [
      "sleep 15",
      "sudo apt-get update -y",
      "sleep 5",
      "chmod 400 /home/ubuntu/.ssh/omar-kp-ajc.pem",
      "sudo apt-get install ansible -y",
      "sudo apt-get install sshpass -y"
      /*"mkdir ansible-deploy",
      "git clone https://github.com/omarpiotr/ansible-deploy-wordpress.git ./ansible-deploy",
      "cd ./ansible-deploy",
      "ansible-galaxy install -r roles/requirements.yml",
      "ansible-playbook -i hosts.yml playbook.yml -e ansible_connection='ssh' -e ansible_host='${aws_instance.ansible_worker.public_ip}' --private-key '/home/ubuntu/.ssh/omar-kp-ajc.pem'"*/
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("D:/Formation/AJC/05.DevOps/PROJET/capge_projet_kp.pem")
      host        = self.public_ip
    }
  }

  provisioner "local-exec" {
      command = "echo ansible-master : ${var.ec2_server_ip} - ${var.ec2_odoo_ip} >> ip_ec2.txt"
  }

}