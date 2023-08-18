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
  subscription_id = "866864ad-a7ed-407a-a344-b81a2b9c878c"
  client_secret = " i5o8Q~R9qs9p4g3iykJsC~NQRej~zLCNUJ6VuaDH"
  client_id = "73fb3ab5-72b2-4656-8748-70bc0312d128"
  tenant_id = "a803e485-d292-4464-aa85-278f32c6bba8"

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
  source = "./library/nsg"
  nsg-name = "win-nsg"
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
  subnet_id = module.subnet.subnet_id
  network_security_group_id = module.nsg.nsg-id

  depends_on = [ azurerm_resource_group.rg, module.subnet ]
}


