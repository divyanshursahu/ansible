variable "instance_name" {
  type = string
  default = "win-vm"
}

variable "instance_location" {
  type = string
  default = "East US"
}

variable "rg_name" {
  type = string
  default = "vm-rg"
}

variable "instance_size" {
  type = string
  default = "B1s"
}

variable "admin_username" {
}

variable "admin_password" {
  
}