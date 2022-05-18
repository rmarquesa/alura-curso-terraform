variable "ami" {
  type = map(string)
  default = {
    "us-east-1" = "ami-0c4f7023847b90238"
    "us-east-2" = "ami-0eea504f45ef7a8f7"
  }
}

variable "cdirs_remote_access" {
  type = list(string)
  default = ["177.62.157.192/32"]
}