resource "azurerm_subnet" "win-subnet" {
  name = "default"
  address_prefixes = [ "10.0.0.0/24" ]
  virtual_network_name = azurerm_virtual_network.win-vnet.name
  resource_group_name = var.resource_group_nameg
}