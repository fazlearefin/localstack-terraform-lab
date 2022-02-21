terraform {
  required_version = ">= 1.1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.2"
    }
  }

  backend "s3" {
    region                      = "us-east-1"
    bucket                      = "tf-state-bucket"
    key                         = "state.tfstate"
    dynamodb_table              = "tf_state_locks"
    encrypt                     = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
    endpoint                    = "http://localhost:4566"
    dynamodb_endpoint           = "http://localhost:4566"
  }
}

provider "aws" {
  region                      = var.region
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    ec2            = "http://localhost:4566"
    es             = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    route53        = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    s3             = "http://localhost:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"
  }
}

resource "aws_instance" "app_server_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
