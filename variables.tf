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
    enabled                 = optional(bool)
    tags                    = optional(map(string))
    criteria = object({
      dimension = list(object({
        name     = string
        operator = optional(string)
        values   = list(string)
      }))
      metric_name = string
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.monitor_scheduled_query_rules_logs : (
        length(v.criteria.dimension) >= 1
      )
    ])
    error_message = "Each dimension list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_scheduled_query_rules_logs : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_scheduled_query_rules_logs : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_scheduled_query_rules_logs : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_scheduled_query_rules_logs : (
        alltrue([for item in v.criteria.dimension : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_scheduled_query_rules_logs : (
        alltrue([for item in v.criteria.dimension : (item.operator == null || (contains(["Include"], item.operator)))])
      )
    ])
    error_message = "must be one of: Include"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_scheduled_query_rules_logs : (
        alltrue([for item in v.criteria.dimension : (alltrue([for x in item.values : length(x) > 0]))])
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
  validation {
    condition = alltrue([
      for k, v in var.monitor_scheduled_query_rules_logs : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 10 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

