## Generic
#==================================
variable "resource_group_name" {

}

variable "location" {
  default = "southindia"
}

## For NIC
#==================================
variable "nic-name" {

}

variable "subnet_id" {

}

variable "public_ip_address_id" {

}

## FOR WINDOWS VM
#==================================

variable "vm-name" {

}

variable "vm-size" {
  default = "Standard_B1s"
}

variable "admin_username" {

}

variable "admin_password" {

}

