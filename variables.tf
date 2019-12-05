//--------------------------------------------------------------------
// Variables
variable "owner" {
  default = "ttp"
}

variable "env" {
  default = "dev"
}

variable "prefix" {
  default = "demo"
}

variable "region" {
  default = "westus"
}

variable "vm_hostname" {
  default = "tfe-linux-demo"
}

variable "remote_port" {
  default = "22"
}

variable "nb_instances" {
  default = "2"
}

variable "delete_disk" {
  default = "true"
}

variable "data_disk_size" {
  default = "64"
}

variable "data_sa_type" {
  default = "Premium_LRS"
}

variable "ssh_public_key" {
}

data "terraform_remote_state" "vnet" {
  backend = "remote"
  config = {
    organization = "TonyPulickal"
    workspaces = {
      name = "demo-az-vnet"
    }
  }
}
