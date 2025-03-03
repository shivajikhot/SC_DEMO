terraform {
  backend "s3" {
    bucket         = "terraform-backend-statefi"  
    key            = "Service_catalog_state/development/terraform.tfstate"
    region         = "us-west-1"            
    encrypt        = true
  }
}
