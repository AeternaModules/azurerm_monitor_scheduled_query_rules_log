output "monitor_scheduled_query_rules_logs_id" {
  description = "Map of id values across all monitor_scheduled_query_rules_logs, keyed the same as var.monitor_scheduled_query_rules_logs"
  value       = { for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "monitor_scheduled_query_rules_logs_authorized_resource_ids" {
  description = "Map of authorized_resource_ids values across all monitor_scheduled_query_rules_logs, keyed the same as var.monitor_scheduled_query_rules_logs"
  value       = { for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : k => v.authorized_resource_ids if v.authorized_resource_ids != null && length(v.authorized_resource_ids) > 0 }
}
output "monitor_scheduled_query_rules_logs_criteria" {
  description = "Map of criteria values across all monitor_scheduled_query_rules_logs, keyed the same as var.monitor_scheduled_query_rules_logs"
  value       = { for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : k => v.criteria if v.criteria != null && length(v.criteria) > 0 }
}
output "monitor_scheduled_query_rules_logs_data_source_id" {
  description = "Map of data_source_id values across all monitor_scheduled_query_rules_logs, keyed the same as var.monitor_scheduled_query_rules_logs"
  value       = { for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : k => v.data_source_id if v.data_source_id != null && length(v.data_source_id) > 0 }
}
output "monitor_scheduled_query_rules_logs_description" {
  description = "Map of description values across all monitor_scheduled_query_rules_logs, keyed the same as var.monitor_scheduled_query_rules_logs"
  value       = { for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : k => v.description if v.description != null && length(v.description) > 0 }
}
output "monitor_scheduled_query_rules_logs_enabled" {
  description = "Map of enabled values across all monitor_scheduled_query_rules_logs, keyed the same as var.monitor_scheduled_query_rules_logs"
  value       = { for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : k => v.enabled if v.enabled != null }
}
output "monitor_scheduled_query_rules_logs_location" {
  description = "Map of location values across all monitor_scheduled_query_rules_logs, keyed the same as var.monitor_scheduled_query_rules_logs"
  value       = { for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : k => v.location if v.location != null && length(v.location) > 0 }
}
output "monitor_scheduled_query_rules_logs_name" {
  description = "Map of name values across all monitor_scheduled_query_rules_logs, keyed the same as var.monitor_scheduled_query_rules_logs"
  value       = { for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : k => v.name if v.name != null && length(v.name) > 0 }
}
output "monitor_scheduled_query_rules_logs_resource_group_name" {
  description = "Map of resource_group_name values across all monitor_scheduled_query_rules_logs, keyed the same as var.monitor_scheduled_query_rules_logs"
  value       = { for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "monitor_scheduled_query_rules_logs_tags" {
  description = "Map of tags values across all monitor_scheduled_query_rules_logs, keyed the same as var.monitor_scheduled_query_rules_logs"
  value       = { for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

