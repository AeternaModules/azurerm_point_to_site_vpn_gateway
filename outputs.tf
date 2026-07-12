output "point_to_site_vpn_gateways_connection_configuration" {
  description = "Map of connection_configuration values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.connection_configuration }
}
output "point_to_site_vpn_gateways_dns_servers" {
  description = "Map of dns_servers values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.dns_servers }
}
output "point_to_site_vpn_gateways_location" {
  description = "Map of location values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.location }
}
output "point_to_site_vpn_gateways_name" {
  description = "Map of name values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.name }
}
output "point_to_site_vpn_gateways_resource_group_name" {
  description = "Map of resource_group_name values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.resource_group_name }
}
output "point_to_site_vpn_gateways_routing_preference_internet_enabled" {
  description = "Map of routing_preference_internet_enabled values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.routing_preference_internet_enabled }
}
output "point_to_site_vpn_gateways_scale_unit" {
  description = "Map of scale_unit values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.scale_unit }
}
output "point_to_site_vpn_gateways_tags" {
  description = "Map of tags values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.tags }
}
output "point_to_site_vpn_gateways_virtual_hub_id" {
  description = "Map of virtual_hub_id values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.virtual_hub_id }
}
output "point_to_site_vpn_gateways_vpn_server_configuration_id" {
  description = "Map of vpn_server_configuration_id values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.vpn_server_configuration_id }
}

