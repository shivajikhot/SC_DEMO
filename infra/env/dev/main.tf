provider "aws" {
  region = "us-east-1"
}

module "iam_group" {
  source = "../../modules/iam_group"
}

module "iam" {
  source       = "../../modules/iam"
  policy_name  = "EC2ResourceCreationAndArtifactAccessPolicy"
  role_name    = "SCLaunch-EC2product"
}

module "service_catalog" {
  source                = "../../modules/service_catalog"
  portfolio_name        = "EC2 Portfolio"
  portfolio_description = "Portfolio for Terraform configurations"
  provider_name         = "IT (it@example.com)"
  product_name          = "EC2_instanace"
  product_owner         = "Devops"
  product_description   = "Terraform product containing an Amazon EC2."
  artifact_version      = "v1.0"
  template_url          = "https://terraform-backend-statefil.s3.us-east-1.amazonaws.com/service-catalog_ec2.tar.gz"
  launch_role_arn       = module.iam.iam_role_arn
  iam_group_arn         = module.iam_group.iam_group_arn
}
