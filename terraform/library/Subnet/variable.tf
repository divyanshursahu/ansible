variable "resource_group_name" {
  
}

variable "vnet_location" {
  default = "southindia"
}

variable "vnet-name" { 
}

variable "address_prefixes" {
  default = ["10.0.0.0/24"]
}


## NSG
# ======================

variable "nsg-name" {
  default = "win-nsg"
}

variable "location" {
  default = "southindia"
}