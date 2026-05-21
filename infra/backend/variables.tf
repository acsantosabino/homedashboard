variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "lambda_function_name" {
  type = string
  default = "myhomedash-backend"
}

variable "lambda_handler" {
  type = string
  default = "app.handler"
}

variable "lambda_runtime" {
  type = string
  default = "python3.11"
}

variable "lambda_package_path" {
  type = string
  default = "../projeto/backend/package/backend.zip"
}

variable "create_lambda" {
  type    = bool
  default = false
}

variable "lambda_managed_policy_arns" {
  type = list(string)
  default = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  ]
}

variable "common_tags" {
  type = map(string)
}
