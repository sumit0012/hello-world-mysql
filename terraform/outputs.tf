output "resource_group_name" {
  value = azurerm_resource_group.aks_rg.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "jumpbox_private_ip" {
  value = azurerm_network_interface.jumpbox_nic.private_ip_address
}

output "ssh_private_key_path" {
  value = local_file.ssh_private_key.filename
}

output "ssh_public_key_path" {
  value = local_file.ssh_public_key.filename
}
