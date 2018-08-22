terraform {
  backend "s3" {
    bucket = "c2-state-files"
    key    = "c2-hello-world-api/tf.state"
    region = "eu-west-2"
  }
  required_version = "> 0.11.0, < 0.12"
}

provider "aws" {
  region  = "us-east-1"
  profile = "c2"
}
