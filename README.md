# TERRAFORM MANIFEST
* Permet la création de 3 instances :
    * Instance MASTER : qui va exécuter les roles ansibles
    * Instance ODOO : qui contiendra la partie Odoo (odoo + postgres)
    * Instance PGADMIN : qui contiendra la partie pgAdmin
* Les variables à surcharger :
    * key_path : chemin ou se trouve la clé privé que va utilié ec2 MASTER pour exectuer les script en ssh
    * key_name : le nom de la clé privé du coté de AWS

```bash
cd app
terraform init
terraform plan -var='key_path=~/.ssh/key.pem'
terraform apply -var='key_path=~/.ssh/key.pem'
```