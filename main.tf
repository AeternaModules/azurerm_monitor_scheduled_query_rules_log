resource "azurerm_monitor_scheduled_query_rules_log" "monitor_scheduled_query_rules_logs" {
  for_each = var.monitor_scheduled_query_rules_logs

  data_source_id          = each.value.data_source_id
  location                = each.value.location
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  authorized_resource_ids = each.value.authorized_resource_ids
  description             = each.value.description
  enabled                 = each.value.enabled
  tags                    = each.value.tags

  criteria {
    dynamic "dimension" {
      for_each = each.value.criteria.dimension
      content {
        name     = dimension.value.name
        operator = dimension.value.operator
        values   = dimension.value.values
      }
    }
    metric_name = each.value.criteria.metric_name
  }
}

