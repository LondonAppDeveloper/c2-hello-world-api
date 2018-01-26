
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

resource "aws_instance" "web" {
  ami             = "ami-28456852"
  instance_type   = "t2.micro"
  key_name        = "${var.ssh_key_name}"
  security_groups = ["${aws_security_group.ecs_ssh_access.name}"]
  iam_instance_profile = "${aws_iam_instance_profile.ecs_host.id}"

  user_data = <<EOF
#!/bin/bash
echo ECS_CLUSTER=${aws_ecs_cluster.main.name} >> /ecs/ecs/ecs.config
EOF
  tags {
    Name = "${var.prefix}-hello-world-ecs"
  }
}

resource "aws_iam_role" "ecs_host_role" {
  name = "${var.prefix}-ecs-host-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ecs_host_role_attachment" {
  role        = "${aws_iam_role.ecs_host_role.name}"
  policy_arn  = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ecs_host" {
  name = "${var.prefix}-ecs-host-instance-profile"
  role = "${aws_iam_role.ecs_host_role.name}"
}

resource "aws_security_group" "ecs_ssh_access" {
  name        = "${var.prefix}-ecs-host-sg"
  description = "Allow inbound SSH access and outbound internet access"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Outbound internet access"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Access"
  }
}
