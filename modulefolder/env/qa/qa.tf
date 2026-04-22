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
    key                  = "QA/qa.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "dev" {
   source = "../../my_modules"
   rg_location = "CentralUS"
   rg_name = "MYDARG"
   vnet_name = "MYQAVNET01"
   subnet01_name = "myqasubnet"
   addressspace = ["10.40.0.0/16"]
   addressprefixes = ["10.40.0.0/22"]
}