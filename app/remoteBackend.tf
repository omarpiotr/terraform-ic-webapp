terraform {
  backend "s3" {
    bucket                  = "capge-bucket-projet"
    key                     = "ic-webapp_project.tfstate"
    region                  = "us-east-1"
    shared_credentials_file = "../.aws/credentials"
  }
}