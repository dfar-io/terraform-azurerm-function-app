output "storage_account_name" {
  description = "Name of the Storage Account created."
  value       = length(azurerm_storage_account.sa) > 0 ? azurerm_storage_account.sa[0].name : ""
}

output "storage_account_primary_access_key" {
  description = "Primary key of the Storage Account created."
  value       = length(azurerm_storage_account.sa) > 0 ? azurerm_storage_account.sa[0].primary_access_key : ""
}

output "storage_account_primary_connection_string" {
  description = "Primary connection string for the Storage Account created."
  value       = length(azurerm_storage_account.sa) > 0 ? azurerm_storage_account.sa[0].primary_connection_string : ""
}

output "possible_outbound_ip_addresses" {
  description = "The possible IP addresses of the Function App."
  value       = azurerm_function_app.fa.possible_outbound_ip_addresses
}

output "default_hostname" {
  description = "The default hostname associated with the Function App - such as mysite.azurewebsites.net."
  value       = azurerm_function_app.fa.default_hostname
}

output "id" {
  description = "The object ID of the function app."
  value       = azurerm_function_app.fa.id
}

output "app_service_plan_id" {
  description = "The App Service plan ID."
  value       = length(azurerm_app_service_plan.asp_fa) > 0 ? azurerm_app_service_plan.asp_fa[0].id : ""
}
