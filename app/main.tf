module "deploy_sg" {
  source = "../modules/sg"
  sg_name = "capge-sg-dev"
}

module "deploy_ec2_server"{
    source = "../modules/ec2_worker"
    serveur = "admin"
    key_name = var.key_name
    sg_group = [ module.deploy_sg.sg_name]
}

module "deploy_ec2_odoo"{
    source = "../modules/ec2_worker"
    serveur = "odoo"
    key_name = var.key_name
    sg_group = [ module.deploy_sg.sg_name]
}

module "deploy_ec2_master" {
    depends_on = [
      module.deploy_ec2_server,
      module.deploy_ec2_odoo
    ]
    source = "../modules/ec2_master"
    serveur = "AnsibleMaster"
    key_name = var.key_name
    private_key_path = var.key_path
    sg_group = [ module.deploy_sg.sg_name]
    ec2_server_ip = module.deploy_ec2_server.ec2_ip
    pgadmin_dns = module.deploy_ec2_server.ec2_dns
    pgadmin_port = var.pgadmin_port
    ec2_odoo_ip = module.deploy_ec2_odoo.ec2_ip
    odoo_dns = module.deploy_ec2_odoo.ec2_dns
    odoo_port = var.odoo_port

}
