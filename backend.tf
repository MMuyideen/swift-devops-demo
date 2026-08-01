terraform {
  backend "s3" {
    bucket       = "deenterraformstate"
    key          = "swift-devops-demo/terraform.tfstate"
    region       = "us-east-1"
  }
}
