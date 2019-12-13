module "us-east-1" {
  source = "./modules/multi-region"
  providers = {
    aws = "aws"
  }
}
module "us-west-2" {
  source = "./modules/multi-region"
  providers = {
    aws = "aws.us-west-2"
  }
}