output "linux_vm_private_ips" {
  value = "${module.linuxservers.network_interface_private_ip}"
}

output "linux_vm_public_ips" {
  value = "${module.linuxservers.public_ip_address}"
}

output "linux_vm_public_dns" {
  value = "${module.linuxservers.public_ip_dns_name}"
}

output "linux_vm_ids" {
  value = "${module.linuxservers.vm_ids}"
}
