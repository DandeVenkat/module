variable "rg_name" {
    type = string 
}

variable "rg_location" {
    type = string 
}

variable "vnet_name" {
    type = string
}

variable "subnet01_name" {
    type = string
   }
variable "addressspace" {
    type = list(string)
   }

variable "addressprefixes" {
    type = list(string)
    }