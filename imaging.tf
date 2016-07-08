provider "aws" {
  access_key = "${var.access_key}"
  region = "${var.region}"
  secret_key = "${var.secret_key}"
}

resource "terraform_remote_state" "remote_state" {
    backend = "s3"
    config {
        bucket = "imaging-platform-terraform-state-prod"
        key = "terraform.tfstate"
        region = "${var.region}"
    }
}
