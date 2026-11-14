variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "project_name" {
  type    = string
  default = "myhomedash"
}

variable "common_tags" {
  type = map(string)
  default = {
    Project = "MyHomeDash"
    Owner   = "MyHomeDash Team"
  }
}
