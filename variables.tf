variable "point_to_site_vpn_gateways" {
  description = <<EOT
Map of point_to_site_vpn_gateways, attributes below
Required:
    - location
    - name
    - resource_group_name
    - scale_unit
    - virtual_hub_id
    - vpn_server_configuration_id
    - connection_configuration (block):
        - internet_security_enabled (optional)
        - name (required)
        - route (optional, block):
            - associated_route_table_id (required)
            - inbound_route_map_id (optional)
            - outbound_route_map_id (optional)
            - propagated_route_table (optional, block):
                - ids (required)
                - labels (optional)
        - vpn_client_address_pool (required, block):
            - address_prefixes (required)
Optional:
    - dns_servers
    - routing_preference_internet_enabled
    - tags
EOT

  type = map(object({
    location                            = string
    name                                = string
    resource_group_name                 = string
    scale_unit                          = number
    virtual_hub_id                      = string
    vpn_server_configuration_id         = string
    dns_servers                         = optional(list(string))
    routing_preference_internet_enabled = optional(bool) # Default: false
    tags                                = optional(map(string))
    connection_configuration = list(object({
      internet_security_enabled = optional(bool) # Default: false
      name                      = string
      route = optional(object({
        associated_route_table_id = string
        inbound_route_map_id      = optional(string)
        outbound_route_map_id     = optional(string)
        propagated_route_table = optional(object({
          ids    = list(string)
          labels = optional(set(string))
        }))
      }))
      vpn_client_address_pool = object({
        address_prefixes = set(string)
      })
    }))
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_point_to_site_vpn_gateway's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: virtual_hub_id
  #   source:    [from virtualwans.ValidateVirtualHubID] !ok
  # path: virtual_hub_id
  #   source:    [from virtualwans.ValidateVirtualHubID] err != nil
  # path: vpn_server_configuration_id
  #   source:    [from virtualwans.ValidateVpnServerConfigurationID] !ok
  # path: vpn_server_configuration_id
  #   source:    [from virtualwans.ValidateVpnServerConfigurationID] err != nil
  # path: connection_configuration.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: connection_configuration.vpn_client_address_pool.address_prefixes[*]
  #   source:    [from validate.CIDR] re != nil && !re.MatchString(cidr)
  # path: connection_configuration.route.associated_route_table_id
  #   source:    [from virtualwans.ValidateHubRouteTableID] !ok
  # path: connection_configuration.route.associated_route_table_id
  #   source:    [from virtualwans.ValidateHubRouteTableID] err != nil
  # path: connection_configuration.route.inbound_route_map_id
  #   source:    [from virtualwans.ValidateRouteMapID] !ok
  # path: connection_configuration.route.inbound_route_map_id
  #   source:    [from virtualwans.ValidateRouteMapID] err != nil
  # path: connection_configuration.route.outbound_route_map_id
  #   source:    [from virtualwans.ValidateRouteMapID] !ok
  # path: connection_configuration.route.outbound_route_map_id
  #   source:    [from virtualwans.ValidateRouteMapID] err != nil
  # path: connection_configuration.route.propagated_route_table.ids[*]
  #   source:    [from virtualwans.ValidateHubRouteTableID] !ok
  # path: connection_configuration.route.propagated_route_table.ids[*]
  #   source:    [from virtualwans.ValidateHubRouteTableID] err != nil
  # path: connection_configuration.route.propagated_route_table.labels[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: scale_unit
  #   condition: value >= 0
  #   message:   must be at least 0
  # path: dns_servers[*]
  #   source:    validation.IsIPv4Address(...) - no translation rule yet, add one
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

