#Azure Generic vNet Module
data "azurerm_resource_group" "network" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "Testing_virtual_network" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.network.name
  location            = data.azurerm_resource_group.network.location
  address_space       = length(var.address_spaces) == 0 ? [var.address_space] : var.address_spaces
  dns_servers         = var.dns_servers
  tags                = var.tags
}
