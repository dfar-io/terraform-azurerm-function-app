output "storage_account_name" {
  description = "Name of the Storage Account created."
  value       = "${azurerm_storage_account.sa.name}"
}

output "storage_account_primary_access_key" {
  description = "Primary key of the Storage Account created."
  value       = "${azurerm_storage_account.sa.primary_access_key}"
}

output "storage_account_primary_connection_string" {
  description = "Primary connection string for the Storage Account created."
  value       = "${azurerm_storage_account.sa.primary_connection_string}"
}

output "possible_outbound_ip_addresses" {
  description = "The possible IP addresses of the Function App."
  value       = "${azurerm_function_app.fa.possible_outbound_ip_addresses}"
}
