output "az_vm_id" {
  description = "The ID of the Linux Virtual Machine."
  value       = azurerm_linux_virtual_machine.myterraformvm.id
}

output "az_vm_private_ip_address" {
  description = "The Primary Private IP Address assigned to this Virtual Machine."
  value       = azurerm_linux_virtual_machine.myterraformvm.private_ip_address
}

output "az_vm_private_ip_addresses" {
  description = "A list of Private IP Addresses assigned to this Virtual Machine."
  value       = azurerm_linux_virtual_machine.myterraformvm.private_ip_addresses
}

output "az_vm_public_ip_address" {
  description = "The Primary Public IP Address assigned to this Virtual Machine."
  value       = azurerm_linux_virtual_machine.myterraformvm.public_ip_address
}

output "az_vm_public_ip_addresses" {
  description = "A list of the Public IP Addresses assigned to this Virtual Machine."
  value       = azurerm_linux_virtual_machine.myterraformvm.public_ip_addresses 
}
