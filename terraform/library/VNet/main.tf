resource "azurerm_virtual_network" "win-vnet" {
  name = var.vnet-name
  location = var.vnet_location
  address_space = var.address_space
  resource_group_name = var.resource_group_name
}
