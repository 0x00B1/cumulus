provider "aws" {}

resource "terraform_remote_state" "remote_state" {
  backend = "s3"
  config {
    bucket = "imaging-platform-terraform-state-production"
    key = "terraform.tfstate"
  }
}
