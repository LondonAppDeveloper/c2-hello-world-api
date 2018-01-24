
terraform {
  backend "s3" {
    bucket = "c2-state-files"
    key    = "c2-hello-world-api/tf.state"
    region = "us-east-1"
  }
  required_version = "> 0.11.0, < 0.12"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_ecs_cluster" "main" {
  name = "${var.prefix}-cluster"
}
