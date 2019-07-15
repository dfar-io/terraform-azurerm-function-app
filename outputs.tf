output "storage_account_primary_connection_string" {
  description = "Primary connection string for the Storage Account created."
  value       = "${azurerm_storage_account.sa.primary_connection_string}"
}
