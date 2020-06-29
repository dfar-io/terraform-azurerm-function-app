terraform {
  required_providers {
    azurerm = ">= 1.36.0"
  }
}

resource "azurerm_storage_account" "sa" {
  count                     = var.storage_account_name != "" ? 1 : 0
  name                      = var.storage_account_name
  resource_group_name       = var.rg_name
  location                  = var.rg_location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  account_kind              = var.storage_account_kind
  enable_https_traffic_only = !var.allow_storage_account_http_traffic
}

resource "azurerm_app_service_plan" "asp_fa" {
  count               = var.app_service_plan_name != "" ? 1 : 0
  name                = var.app_service_plan_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  kind                = var.tier == "Dynamic" && var.size == "Y1" ? "FunctionApp" : "Windows"

  sku {
    tier = var.tier
    size = var.size
  }
}

resource "azurerm_function_app" "fa" {
  name                      = var.function_app_name
  resource_group_name       = var.rg_name
  location                  = var.rg_location
  app_service_plan_id       = var.app_service_plan_id != "" ? var.app_service_plan_id : azurerm_app_service_plan.asp_fa[0].id
  storage_connection_string = var.storage_account_connection_string != "" ? var.storage_account_connection_string : azurerm_storage_account.sa[0].primary_connection_string
  version                   = var.runtime_version
  app_settings              = var.app_settings
  https_only                = !var.allow_http
  site_config {
    always_on = var.always_on
    cors {
      allowed_origins = var.cors_allowed_origins
    }
  }
}
