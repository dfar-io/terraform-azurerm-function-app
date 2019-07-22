variable "rg_name" {
  description = "The name of the Resource Group the Function App will be contained in."
}
variable "rg_location" {
  description = "The name of the Resource Group the Function App will be contained in."
}
variable "storage_account_name" {
  description = "The Storage Account name for Function App."
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
variable "tier" {
  description = "The tier the function app will use. (defaults to Consumption)"
  default     = "Dynamic"
}
variable "size" {
  description = "The size the function app will use. (defaults to Consumption)"
  default     = "Y1"
}
