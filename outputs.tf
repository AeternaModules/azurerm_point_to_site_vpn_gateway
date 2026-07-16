output "point_to_site_vpn_gateways_id" {
  description = "Map of id values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.id if v.id != null && length(v.id) > 0 }
}
output "point_to_site_vpn_gateways_connection_configuration" {
  description = "Map of connection_configuration values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.connection_configuration if v.connection_configuration != null && length(v.connection_configuration) > 0 }
}
output "point_to_site_vpn_gateways_dns_servers" {
  description = "Map of dns_servers values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.dns_servers if v.dns_servers != null && length(v.dns_servers) > 0 }
}
output "point_to_site_vpn_gateways_location" {
  description = "Map of location values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.location if v.location != null && length(v.location) > 0 }
}
output "point_to_site_vpn_gateways_name" {
  description = "Map of name values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.name if v.name != null && length(v.name) > 0 }
}
output "point_to_site_vpn_gateways_resource_group_name" {
  description = "Map of resource_group_name values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "point_to_site_vpn_gateways_routing_preference_internet_enabled" {
  description = "Map of routing_preference_internet_enabled values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.routing_preference_internet_enabled if v.routing_preference_internet_enabled != null }
}
output "point_to_site_vpn_gateways_scale_unit" {
  description = "Map of scale_unit values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.scale_unit if v.scale_unit != null }
}
output "point_to_site_vpn_gateways_tags" {
  description = "Map of tags values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "point_to_site_vpn_gateways_virtual_hub_id" {
  description = "Map of virtual_hub_id values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.virtual_hub_id if v.virtual_hub_id != null && length(v.virtual_hub_id) > 0 }
}
output "point_to_site_vpn_gateways_vpn_server_configuration_id" {
  description = "Map of vpn_server_configuration_id values across all point_to_site_vpn_gateways, keyed the same as var.point_to_site_vpn_gateways"
  value       = { for k, v in azurerm_point_to_site_vpn_gateway.point_to_site_vpn_gateways : k => v.vpn_server_configuration_id if v.vpn_server_configuration_id != null && length(v.vpn_server_configuration_id) > 0 }
}

