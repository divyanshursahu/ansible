output "nsg" {
  value = azurerm_network_security_group.nsg
}

output "nsg-id" {
  value = azurerm_network_security_group.nsg.id
}