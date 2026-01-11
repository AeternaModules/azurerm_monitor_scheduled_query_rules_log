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
    enabled                 = optional(bool, true)
    tags                    = optional(map(string))
    criteria = object({
      dimension = object({
        name     = string
        operator = optional(string, "Include")
        values   = list(string)
      })
      metric_name = string
    })
  }))
}

