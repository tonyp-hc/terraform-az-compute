terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.97.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "linuxservers" {
  source                            = "app.terraform.io/TonyPulickal/compute/azurerm"
  resource_group_name               = "${var.prefix}-rg"
  vm_hostname                       = var.vm_hostname
  nb_public_ip                      = "1"
  public_ip_dns                     = ["tfelinuxdemo"]
  remote_port                       = var.remote_port
  nb_instances                      = var.nb_instances
  vnet_subnet_id                    = data.terraform_remote_state.vnet.outputs.az_network_subnets[0]
  delete_os_disk_on_termination     = var.delete_disk
  enable_ssh_key                    = false
  tags = {
    environment = var.env
    owner       = var.owner
  }
}
