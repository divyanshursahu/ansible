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
  client_secret = var.client_secret
  client_id = var.client_id
  tenant_id = var.tenant_id
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

# module "pub-ip" {
#   source = "./library/Public-IP"

#   resource_group_name = var.resource_group_name
#   pub_ip_name         = var.pub_ip_name

#   depends_on = [azurerm_resource_group.rg]
# }



