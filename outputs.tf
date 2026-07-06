output "point_to_site_vpn_gateways" {
  description = "All point_to_site_vpn_gateway resources"
  value       = azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways
}
output "point_to_site_vpn_gateways_connection_configuration" {
  description = "List of connection_configuration values across all point_to_site_vpn_gateways"
  value       = [for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : v.connection_configuration]
}
output "point_to_site_vpn_gateways_dns_servers" {
  description = "List of dns_servers values across all point_to_site_vpn_gateways"
  value       = [for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : v.dns_servers]
}
output "point_to_site_vpn_gateways_location" {
  description = "List of location values across all point_to_site_vpn_gateways"
  value       = [for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : v.location]
}
output "point_to_site_vpn_gateways_name" {
  description = "List of name values across all point_to_site_vpn_gateways"
  value       = [for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : v.name]
}
output "point_to_site_vpn_gateways_resource_group_name" {
  description = "List of resource_group_name values across all point_to_site_vpn_gateways"
  value       = [for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : v.resource_group_name]
}
output "point_to_site_vpn_gateways_routing_preference_internet_enabled" {
  description = "List of routing_preference_internet_enabled values across all point_to_site_vpn_gateways"
  value       = [for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : v.routing_preference_internet_enabled]
}
output "point_to_site_vpn_gateways_scale_unit" {
  description = "List of scale_unit values across all point_to_site_vpn_gateways"
  value       = [for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : v.scale_unit]
}
output "point_to_site_vpn_gateways_tags" {
  description = "List of tags values across all point_to_site_vpn_gateways"
  value       = [for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : v.tags]
}
output "point_to_site_vpn_gateways_virtual_hub_id" {
  description = "List of virtual_hub_id values across all point_to_site_vpn_gateways"
  value       = [for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : v.virtual_hub_id]
}
output "point_to_site_vpn_gateways_vpn_server_configuration_id" {
  description = "List of vpn_server_configuration_id values across all point_to_site_vpn_gateways"
  value       = [for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : v.vpn_server_configuration_id]
}

