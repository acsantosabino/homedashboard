variable "bucket_name" {
  type = string
}

variable "default_root_object" {
  type    = string
  default = "index.html"
}

variable "create_distribution" {
  type    = bool
  default = false
}

variable "tags" {
  type = map(string)
  default = {}
}
