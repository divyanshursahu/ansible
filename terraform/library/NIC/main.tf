resource "azurerm_network_interface" "vm-nic" {
  name = "${var.vm-name}-nic"
  location = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name = "pub-ip"
    subnet_id = azurerm_subnet.win-subnet.id
    private_ip_address = "Dynamic"
    public_ip_address_id = "Dynamic"
  }
}