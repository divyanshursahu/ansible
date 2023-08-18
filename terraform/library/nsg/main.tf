resource "azurerm_network_security_group" "nsg" {
  name = var.nsg-name
  location = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "name" {
  name = "Rule"
  priority = 101
  direction = "Inbound"
  access = "Allow"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = "*"
  source_address_prefix = "*"
  destination_address_prefix = "*"
  network_security_group_name = var.nsg-name
  resource_group_name = var.resource_group_name
  
  depends_on = [ azurerm_network_security_group.nsg ]
}

