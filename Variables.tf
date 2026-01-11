# Region variable for AWS provider

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-west-2"
}


# Variables for EC2 {lab_ec2_app}

variable "instance_name" {
  type        = string
  description = "Value for the Name tag"
  default     = "lab_ec2_app"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "Existing EC2 key pair name"
  default     = "key2026"
}

variable "ami_owners" {
  type        = list(string)
  description = "AMI owner IDs (Amazon = amazon)"
  default     = ["amazon"]
}

variable "ami_name_pattern" {
  type        = string
  description = "AMI name pattern filter"
  default     = "al2023-ami-*-x86_64"
}

variable "index_message" {
  type        = string
  description = "Message written to the Apache index.html"
  default     = "Hello World I'm Here!!!!!"
}

variable "extra_tags" {
  type        = map(string)
  description = "Extra tags to apply to the instance"
  default     = {}
}


