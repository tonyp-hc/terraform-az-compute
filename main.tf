module "linuxservers" {
  source  = "app.terraform.io/TonyPulickal/compute/azurerm"
  resource_group_name           = "${var.prefix}-rg-tfe"
  location                      = "${var.region}"
  vm_hostname                   = "${var.vm_hostname}"
  nb_public_ip                  = "1"
  remote_port                   = "${var.remote_port}"
  nb_instances                  = "${var.nb_instances}"
  vm_os_publisher               = "Canonical"
  vm_os_offer                   = "UbuntuServer"
  vm_os_sku                     = "14.04.2-LTS"
  vnet_subnet_id                = data.terraform_remote_state.vnet.outputs.az_network_subnets[0]
  boot_diagnostics              = "true"
  delete_os_disk_on_termination = "${var.delete_disk}"
  data_disk                     = "true"
  data_disk_size_gb             = "${var.data_disk_size}"
  data_sa_type                  = "${var.data_sa_type}"

  tags = {
    environment = "${var.env}"
    owner       = "${var.owner}"
  }
}
