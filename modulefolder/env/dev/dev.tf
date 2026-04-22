terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.69.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "azureaksrg"
    storage_account_name = "mystorage3241"
    container_name       = "tfstate"
    key                  = "DEV/dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "dev" {
   source = "../../my_modules"
   rg_location = "EastUS"
   rg_name = "MYDEVRG"
   vnet_name = "MYDEVVNET01"
   subnet01_name = "mydevsubnet"
   addressspace = ["10.20.0.0/16"]
   addressprefixes = ["10.20.0.0/22"]
}