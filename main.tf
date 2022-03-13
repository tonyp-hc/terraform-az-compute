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

resource "azurerm_network_interface" "tfdemo" {
  name                = "ttp-demo-nic"
  location            = var.region 
  resource_group_name = "${var.prefix}-rg" 

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.terraform_remote_state.vnet.outputs.az_network_subnets[0] 
    private_ip_address_allocation = "Dynamic"
  }
}

# retrieve github public key
data "http" "public-key" {
  url = "https://github.com/tonyp-hc.keys"
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "myterraformvm" {
  name                  = var.vm_hostname
  location              = var.region
  resource_group_name   = "${var.prefix}-rg" 
  network_interface_ids = [azurerm_network_interface.tfdemo.id]
  size                  = "Standard_DS1_v2"

  os_disk {
      name              = "myOsDisk"
      caching           = "ReadWrite"
      storage_account_type = "Premium_LRS"
  }

  source_image_reference {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
  }

  computer_name  = var.vm_hostname
  admin_username = "ttp"
  disable_password_authentication = true

  admin_ssh_key {
      username       = "ttp"
      public_key     = data.http.public-key.body 
  }

  tags = {
    environment = var.env
    owner       = var.owner
  }
}
