variable "api_name" {
  type = string
}

variable "lambda_function_arn" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "create" {
  type    = bool
  default = true
}
