output "nsg_name" {
  value = azurerm_network_security_group.nsg.name
  
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}


output "subnet1_id" {
  value = azurerm_subnet.subnet1.id
}

output "subnet1_name" {
  value = azurerm_subnet.subnet1.name
}

output "subnet2_id" {
  value = azurerm_subnet.subnet2.id
}

output "subnet2_name" {
  value = azurerm_subnet.subnet2.name
} # End of snippet