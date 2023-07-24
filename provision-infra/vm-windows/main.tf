resource "azurerm_windows_virtual_machine" "win-vm" {
    name = var.instance_name
    location = var.instance_location
    resource_group_name = var.rg_name
    size = var.instance_size
    admin_username = var.admin_username
    admin_password = var.admin_password
    
}

