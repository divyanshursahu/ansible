# For credentials

variable "subscription_id" {}
variable "tenant_id" {}
variable "client_id" {}
variable "client_secret" {}

variable "resource_group_name" {
  default = "app-rg"
}

variable "vm-name" {
  default = "win-vm"
}

variable "location" {
  default = "southindia"
}

variable "vnet-name" {

}

variable "pub_ip_name" {

}