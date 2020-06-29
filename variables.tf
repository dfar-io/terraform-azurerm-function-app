# Required
variable "rg_name" {
  description = "The name of the Resource Group the Function App will be contained in."
}
variable "rg_location" {
  description = "The location of the Resource Group the Function App will be contained in."
}
variable "function_app_name" {
  description = "The Function App Name."
}

# Optional
variable "storage_account_kind" {
  description = "The Storage Account type."
  default     = "Storage"
}
variable "allow_storage_account_http_traffic" {
  description = "Allows for the Storage Account created to accept HTTP traffic"
  default     = false
}
variable "app_settings" {
  description = "Function App settings."
  default     = {}
}
variable "allow_http" {
  description = "Allows for the Function App to accept HTTP connections."
  default     = false
}
variable "always_on" {
  description = "Whether the Function App should always be on (only applies to dedicated App Service Plans)."
  default     = false
}
variable "tier" {
  description = "The tier the function app will use. (defaults to Consumption)"
  default     = "Dynamic"
}
variable "size" {
  description = "The size the function app will use. (defaults to Consumption)"
  default     = "Y1"
}
variable "cors_allowed_origins" {
  description = "Allowed origins (CORS) for the Function App."
  type        = list(string)
  default     = []
}
variable "runtime_version" {
  description = "The runtime version of the Function App."
  default     = "~3"
}
variable "app_service_plan_id" {
  description = "ID of an existing App Service plan (allows for multiple function apps to use a single plan)."
  default     = ""
}
variable "app_service_plan_name" {
  description = "The name of the App Service plan to create."
  default     = ""
}
variable "storage_account_connection_string" {
  description = "Connection string of an existing Storage Account (allows for multiple function apps to use a single storage account)."
  default     = ""
}
variable "storage_account_name" {
  description = "Storage Account name."
  default     = ""
}