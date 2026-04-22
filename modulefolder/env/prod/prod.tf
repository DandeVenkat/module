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
    key                  = "PROD/prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "dev" {
   source = "../../my_modules"
   rg_location = "WestUS"
   rg_name = "MYPRODRG"
   vnet_name = "MYPRODVNET01"
   subnet01_name = "myprodsubnet"
   addressspace = ["10.30.0.0/16"]
   addressprefixes = ["10.30.0.0/22"]
}