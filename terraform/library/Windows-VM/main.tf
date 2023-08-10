resource "azurerm_windows_virtual_machine" "win-vm" {
  name = var.vm-name
  location = var.location

}