variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "frontend_bucket_name" {
  type = string
}

variable "create_frontend_distribution" {
  type    = bool
  default = false
}

variable "common_tags" {
  type = map(string)
}
