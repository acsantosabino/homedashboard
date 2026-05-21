variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "api_name" {
  type = string
}

variable "lambda_function_arn" {
  type = string
  default = ""
}

variable "create_api" {
  type    = bool
  default = false
}

variable "common_tags" {
  type = map(string)
}
