terraform {
  cloud {
    organization = "divanshu"

    workspaces {
      name = "win-vm"
    }
  }

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = "value"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_secret   = var.client_secret
  client_id       = var.client_id
  tenant_id       = var.tenant_id

}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "virtual-network" {
  source = "./library/VNet"

  resource_group_name = var.resource_group_name
  vnet-name           = var.vnet-name

  depends_on = [
    azurerm_resource_group.rg
  ]
}

module "subnet" {
  source = "./library/Subnet"

  resource_group_name = var.resource_group_name
  vnet-name           = module.virtual-network.virtual_network_name

  depends_on = [azurerm_resource_group.rg, module.virtual-network]
}


module "pub-ip" {
  source = "./library/Public-IP"

  resource_group_name = var.resource_group_name
  pub_ip_name         = var.pub_ip_name

  depends_on = [azurerm_resource_group.rg]
}

module "nsg" {
  source              = "./library/nsg"
  nsg-name            = "win-nsg"
  resource_group_name = var.resource_group_name

  depends_on = [azurerm_resource_group.rg]
}

module "win-vm" {
  source = "./library/Windows-VM"

  resource_group_name  = var.resource_group_name
  nic-name             = var.nic-name
  subnet_id            = module.subnet.subnet_id
  public_ip_address_id = module.pub-ip.public_ip_address_id
  vm-name              = var.vm-name
  admin_username       = var.admin_username
  admin_password       = var.admin_password

}

resource "azurerm_subnet_network_security_group_association" "name" {
  subnet_id                 = module.subnet.subnet_id
  network_security_group_id = module.nsg.nsg-id

  depends_on = [azurerm_resource_group.rg, module.subnet]
}

resource "azurerm_virtual_machine_extension" "name" {
  name                 = "win-machine"
  virtual_machine_id   = module.win-vm.win-vm-id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = <<SETTINGS
 {
  "commandToExecute": "powershell.exe script.ps1"
 }
SETTINGS

# protected_settings = <<PROTECTED_SETTINGS
#     {}
# PROTECTED_SETTINGS
}
