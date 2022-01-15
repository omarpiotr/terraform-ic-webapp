# TERRAFORM MANIFEST
* Permet la création de 3 instances :
    * Instance MASTER : qui va exécuter les roles ansibles
    * Instance ODOO : qui contiendra la partie Odoo (odoo + postgres)
    * Instance PGADMIN : qui contiendra la partie pgAdmin
* Les variables à surcharger :
    * key_path : chemin ou se trouve la clé privé que va utilié ec2 MASTER pour exectuer les script en ssh
    * key_name : le nom de la clé privé du coté de AWS
    * key_access : Access key du provider
    * key_secret : Secret key du provider

```bash
cd app
terraform init
terraform plan -var='key_access=YOURACCESSKEY' -var='key_secret=YOURSECRETKEY' -var='key_path=~/.ssh/key.pem'
terraform apply -var='key_access=YOURACCESSKEY' -var='key_secret=YOURACCESSKEY' -var='key_path=~/.ssh/key.pem'
```