variable "role_name" {
  type = string
}

variable "assume_service" {
  type = string
  default = "lambda.amazonaws.com"
}

variable "managed_policy_arns" {
  type = list(string)
  default = []
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "create" {
  type    = bool
  default = true
}
