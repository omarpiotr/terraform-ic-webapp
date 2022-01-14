module "deploy_sg" {
  source = "../modules/sg"
  sg_name = "capge-sg-dev"
}

module "deploy_ec2_server"{
    source = "../modules/ec2_worker"
    serveur = "admin"
    key_name = "capge_projet_kp"
    private_key_path = "D:/Formation/AJC/05.DevOps/PROJET/capge_projet_kp.pem"
    sg_group = [ module.deploy_sg.sg_name]
}

module "deploy_ec2_odoo"{
    source = "../modules/ec2_worker"
    serveur = "odoo"
    key_name = "capge_projet_kp"
    private_key_path = "D:/Formation/AJC/05.DevOps/PROJET/capge_projet_kp.pem"
}

module "deploy_ec2_master" {
    source = "../modules/ec2_master"
    serveur = "AnsibleMaster"
    key_name = "capge_projet_kp"
    private_key_path = "D:/Formation/AJC/05.DevOps/PROJET/capge_projet_kp.pem"
    ec2_server_ip = module.deploy_ec2_server.ec2_ip
    ec2_odoo_ip = module.deploy_ec2_odoo.ec2_ip
}
