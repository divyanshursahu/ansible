# locals {
#   custom_data = <<-EOF
# <powershell>
#  New-NetFirewallRule -DisplayName “AllowAnsible” -Direction Inbound -Protocol TCP –LocalPort 5985 -Action Allow
# </powershell>
# EOF
# }

resource "azurerm_network_interface" "vm-nic" {
  name                = var.nic-name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "pub-ip"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_address_id
  }
}


resource "azurerm_windows_virtual_machine" "win-vm" {
  name                = var.vm-name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm-size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.vm-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  #  provisioner "remote-exec" {
  #    inline = [ 
  #      "powershell.exe New-NetFirewallRule -DisplayName “AllowAnsible” -Direction Inbound -Protocol TCP –LocalPort 5985 -Action Allow"
  #     ]
  #    connection {
  #      type = "winrm"
  #      user = var.admin_username
  #      password = var.admin_password
  #      host = self.public_ip_address
  #      use_ntlm = true
  #    }
  #  }

  # provisioner "file" {
  #   source      = "test.txt"
  #   destination = "C:/tmp/test.txt"

  #   connection {
  #     type     = "winrm"
  #     user     = var.admin_username
  #     password = var.admin_password
  #     host     = self.public_ip_address
  #     use_ntlm = true
  #   }
  # }

 # custom_data = base64encode(local.custom_data)
}

# locals {
#   custom_data = <<-EOF
#     <powershell>
#     # PowerShell script to disable Windows Firewall
#     # Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
#      New-NetFirewallRule -DisplayName “AllowAnsible” -Direction Inbound -Protocol TCP –LocalPort 5985 -Action Allow
#     </powershell>
#   EOF
# }