resource "azurerm_subnet" "win-subnet" {
  name = "default"
  address_prefixes = var.address_prefixes
  virtual_network_name = var.vnet-name
  resource_group_name = var.resource_group_name
}

