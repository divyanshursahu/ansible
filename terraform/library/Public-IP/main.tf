resource "azurerm_public_ip" "pub-ip" {
  name = var.pub_ip_name
  resource_group_name = var.resource_group_name
  location = var.location
  allocation_method = "Static"
  sku = "Standard"
}