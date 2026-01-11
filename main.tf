resource "azurerm_point_to_site_vpn_gateway" "point_to_site_vpn_gateways" {
  for_each = var.point_to_site_vpn_gateways

  location                            = each.value.location
  name                                = each.value.name
  resource_group_name                 = each.value.resource_group_name
  scale_unit                          = each.value.scale_unit
  virtual_hub_id                      = each.value.virtual_hub_id
  vpn_server_configuration_id         = each.value.vpn_server_configuration_id
  dns_servers                         = each.value.dns_servers
  routing_preference_internet_enabled = each.value.routing_preference_internet_enabled
  tags                                = each.value.tags

  connection_configuration {
    internet_security_enabled = each.value.connection_configuration.internet_security_enabled
    name                      = each.value.connection_configuration.name
    dynamic "route" {
      for_each = each.value.connection_configuration.route != null ? [each.value.connection_configuration.route] : []
      content {
        associated_route_table_id = route.value.associated_route_table_id
        inbound_route_map_id      = route.value.inbound_route_map_id
        outbound_route_map_id     = route.value.outbound_route_map_id
        dynamic "propagated_route_table" {
          for_each = route.value.propagated_route_table != null ? [route.value.propagated_route_table] : []
          content {
            ids    = propagated_route_table.value.ids
            labels = propagated_route_table.value.labels
          }
        }
      }
    }
    vpn_client_address_pool {
      address_prefixes = each.value.connection_configuration.vpn_client_address_pool.address_prefixes
    }
  }
}

