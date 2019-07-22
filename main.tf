resource "azurerm_storage_account" "sa" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = "${var.rg_name}"
  location                 = "${var.rg_location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "asp_fa" {
  name                = "${var.function_app_plan_name}"
  resource_group_name = "${var.rg_name}"
  location            = "${var.rg_location}"
  kind                = "${var.tier == "Dynamic" && var.size == "Y1" ? "FunctionApp" : "Windows"}"

  sku {
    tier = "${var.tier}"
    size = "${var.size}"
  }
}

resource "azurerm_function_app" "fa" {
  name                      = "${var.function_app_name}"
  resource_group_name       = "${var.rg_name}"
  location                  = "${var.rg_location}"
  app_service_plan_id       = "${azurerm_app_service_plan.asp_fa.id}"
  storage_connection_string = "${azurerm_storage_account.sa.primary_connection_string}"
  version                   = "~2"
  app_settings              = "${var.app_settings}"
}
