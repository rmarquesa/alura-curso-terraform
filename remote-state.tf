terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "rma-learning"

    workspaces {
      name = "alura-curso-terraform"
    }
  }
}