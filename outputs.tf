output "monitor_scheduled_query_rules_logs" {
  description = "All monitor_scheduled_query_rules_log resources"
  value       = azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs
}
output "monitor_scheduled_query_rules_logs_authorized_resource_ids" {
  description = "List of authorized_resource_ids values across all monitor_scheduled_query_rules_logs"
  value       = [for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : v.authorized_resource_ids]
}
output "monitor_scheduled_query_rules_logs_criteria" {
  description = "List of criteria values across all monitor_scheduled_query_rules_logs"
  value       = [for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : v.criteria]
}
output "monitor_scheduled_query_rules_logs_data_source_id" {
  description = "List of data_source_id values across all monitor_scheduled_query_rules_logs"
  value       = [for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : v.data_source_id]
}
output "monitor_scheduled_query_rules_logs_description" {
  description = "List of description values across all monitor_scheduled_query_rules_logs"
  value       = [for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : v.description]
}
output "monitor_scheduled_query_rules_logs_enabled" {
  description = "List of enabled values across all monitor_scheduled_query_rules_logs"
  value       = [for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : v.enabled]
}
output "monitor_scheduled_query_rules_logs_location" {
  description = "List of location values across all monitor_scheduled_query_rules_logs"
  value       = [for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : v.location]
}
output "monitor_scheduled_query_rules_logs_name" {
  description = "List of name values across all monitor_scheduled_query_rules_logs"
  value       = [for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : v.name]
}
output "monitor_scheduled_query_rules_logs_resource_group_name" {
  description = "List of resource_group_name values across all monitor_scheduled_query_rules_logs"
  value       = [for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : v.resource_group_name]
}
output "monitor_scheduled_query_rules_logs_tags" {
  description = "List of tags values across all monitor_scheduled_query_rules_logs"
  value       = [for k, v in azurerm_monitor_scheduled_query_rules_log.monitor_scheduled_query_rules_logs : v.tags]
}

