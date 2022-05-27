variable "notification" {
  type = map(string)
  default = {
    "cloud_manager" = ""
    "cloud_administrator" = "rodrigomarquesalves@gmail.com"
    "cloud_architect" = ""
    "cloud_engineer" = ""
    "cloud_developer" = ""
  }
}

variable "ami" {
  type = map(string)
  default = {
    "us-east-1" = "ami-0c4f7023847b90238"
    "us-east-2" = "ami-0eea504f45ef7a8f7"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "cdirs_remote_access" {
  type = list(string)
  default = ["177.62.157.192/32"]
}

variable "key_name" {
  default = "terraform-aws"
}

variable "budget_monthly" {
  type = number
  default = 5
}