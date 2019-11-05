variable "rg_name" {
  description = "The name of the Resource Group the Function App will be contained in."
}
variable "rg_location" {
  description = "The name of the Resource Group the Function App will be contained in."
}
variable "storage_account_name" {
  description = "The Storage Account name for Function App."
}
variable "storage_account_kind" {
  description = "The Storage Account type."
  default = "Storage"
}
variable "storage_account_enable_https_traffic_only" {
  description = "If the created Storage Account should only allow HTTPS connections."
  default = "false"
}
variable "function_app_plan_name" {
  description = "The Function App Service Plan."
}
variable "function_app_name" {
  description = "The Function App Name."
}
variable "app_settings" {
  description = "Function App settings."
  default     = {}
}
variable "https_only" {
  description = "If the function app should force HTTPS."
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
