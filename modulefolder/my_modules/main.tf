resource "azurerm_resource_group" "rgname" {
    name = var.rg_name
    location = var.rg_location  
}

resource "azurerm_virtual_network" "vnet_block" {
    name = var.vnet_name
    resource_group_name = azurerm_resource_group.rgname.name
    location = azurerm_resource_group.rgname.location
    address_space = var.addressspace
}

resource "azurerm_subnet" "subnet_block" {
    name = var.subnet01_name
    address_prefixes = var.addressprefixes
    resource_group_name = azurerm_resource_group.rgname.name
    virtual_network_name = azurerm_virtual_network.vnet_block.name
}