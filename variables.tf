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
    routing_preference_internet_enabled = optional(bool)
    tags                                = optional(map(string))
    connection_configuration = list(object({
      internet_security_enabled = optional(bool)
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
  validation {
    condition = alltrue([
      for k, v in var.point_to_site_vpn_gateways : (
        length(v.connection_configuration) >= 1
      )
    ])
    error_message = "Each connection_configuration list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.point_to_site_vpn_gateways : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.point_to_site_vpn_gateways : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.point_to_site_vpn_gateways : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.point_to_site_vpn_gateways : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.point_to_site_vpn_gateways : (
        alltrue([for item in v.connection_configuration : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.point_to_site_vpn_gateways : (
        alltrue([for item in v.connection_configuration : (item.route == null || (item.route.propagated_route_table == null || (item.route.propagated_route_table.labels == null || (alltrue([for x in item.route.propagated_route_table.labels : length(x) > 0])))))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.point_to_site_vpn_gateways : (
        v.scale_unit >= 0
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.point_to_site_vpn_gateways : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 19 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

