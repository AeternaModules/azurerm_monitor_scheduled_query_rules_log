variable "monitor_scheduled_query_rules_logs" {
  description = <<EOT
Map of monitor_scheduled_query_rules_logs, attributes below
Required:
    - data_source_id
    - location
    - name
    - resource_group_name
    - criteria (block):
        - dimension (required, block):
            - name (required)
            - operator (optional)
            - values (required)
        - metric_name (required)
Optional:
    - authorized_resource_ids
    - description
    - enabled
    - tags
EOT

  type = map(object({
    data_source_id          = string
    location                = string
    name                    = string
    resource_group_name     = string
    authorized_resource_ids = optional(set(string))
    description             = optional(string)
    enabled                 = optional(bool) # Default: true
    tags                    = optional(map(string))
    criteria = object({
      dimension = object({
        name     = string
        operator = optional(string) # Default: "Include"
        values   = list(string)
      })
      metric_name = string
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.monitor_scheduled_query_rules_logs : (
        length(v.criteria.dimension.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_scheduled_query_rules_logs : (
        v.criteria.dimension.operator == null || (contains(["Include"], v.criteria.dimension.operator))
      )
    ])
    error_message = "must be one of: Include"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_scheduled_query_rules_logs : (
        length(v.criteria.dimension.values) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_scheduled_query_rules_logs : (
        length(v.criteria.metric_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_scheduled_query_rules_logs : (
        v.description == null || (length(v.description) >= 1 && length(v.description) <= 4096)
      )
    ])
    error_message = "must be between 1 and 4096 characters"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_monitor_scheduled_query_rules_log's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validation.StringDoesNotContainAny(...) - no translation rule yet, add one
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
  # path: authorized_resource_ids[*]
  #   source:    [from azure.ValidateResourceID] !ok
  # path: authorized_resource_ids[*]
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: data_source_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: data_source_id
  #   source:    [from azure.ValidateResourceID] err != nil
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

