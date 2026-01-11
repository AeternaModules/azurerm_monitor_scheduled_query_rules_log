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
    dimension {
      name     = each.value.criteria.dimension.name
      operator = each.value.criteria.dimension.operator
      values   = each.value.criteria.dimension.values
    }
    metric_name = each.value.criteria.metric_name
  }
}

