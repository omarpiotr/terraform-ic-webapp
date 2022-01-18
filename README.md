# TERRAFORM MANIFEST
* Permet la création de 3 instances :
    * Instance MASTER : qui va exécuter les roles ansibles
        * https://github.com/omarpiotr/ansible_deploy_ic-webapp.git
    * Instance ODOO : qui contiendra la partie Odoo (odoo + postgres)
    * Instance PGADMIN : qui contiendra la partie pgAdmin + ic-webapp
* Mettre à jour le fichier .aws/credential en y remplacant les valeurs suivantes par vos données:
    * YOUR_KEY_ID
    * YOUR_ACCESS_KEY
* Les variables à surcharger obligatoirement:
    * **key_path** : chemin ou se trouve la clé privé que va utilié ec2 MASTER pour exectuer les script en ssh
    * **key_name** : le nom de la clé privé du coté de AWS
    * **ic-webapp_image** : le nom de l'image sur dockerhub (par défaut lianhuahayu/ic-webapp:1.0)
* Les variables optionnelle à surcharger :
    * **odoo_port** : port de l'interface web de odoo
    * **pgadmin_port** : port de l'interface web de pgadmin

```bash
cd app
terraform init
terraform plan 
terraform apply -var='key_path=~/.ssh/key.pem' \
                -var='ic-webapp_image=lianhuahayu/ic-webapp:1.0' \
                -var='odoo_image=odoo:13.0' \
                -var='postgres_image=postgres:10'
```