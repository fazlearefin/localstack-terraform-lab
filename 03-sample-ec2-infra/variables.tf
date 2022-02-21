variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "AppServerInstance"
}

variable "ami_id" {
  description = "Value of the AMI ID for the EC2 instance"
  type        = string
  default     = "ami-a034542757f631"
}

variable "instance_type" {
  description = "Value of the instance size of the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "region" {
  description = "Value of the AWS region where the resource will be created"
  type        = string
  default     = "us-east-1"
}
