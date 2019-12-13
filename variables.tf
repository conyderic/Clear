variable "enabled" {
  description = "The boolean flag whether this module is enabled or not. No resources are created when set to false."
  default     = true
}
variable "tags" {
  description = "Specifies object tags key and value. This applies to all resources created by this module."
  default = {
    "Terraform" = true
  }
}
variable "AWS_ACCESS_KEY" {
  description = "Enter your AWS access key"
}
variable "AWS_SECRET_KEY" {
  description = "Enter your AWS secret key"
}
variable "AWS_REGION" {
  description = "The AWS region you want this architecture to be deployed. The following regions are approved by Avalara CSS: us-east-1, us-west-2, eu-west-1, ap-south-1"
}
