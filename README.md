# terraform-azurerm-function-app-module

A Terraform module used to easily create a Function App inside Azure.

Features:
- Can create a app service plan and storage account inside the module.
- Can link to an existing app service plan and storage account.
- Defaults to only allowing HTTPS connections (can opt into allowing HTTP).

## Requirements

- azurerm - =1.36 

## Usage

Create a function app with included consumption app service plan and storage account:

```
provider "azurerm" {
  version         = "=1.36"
}

resource "azurerm_resource_group" "rg" {
  name     = "test-resource-group"
  location = "East US"
}

module "function-app-1" {
  source  = "dfar-io/function-app/azurerm"
  version = "3.0.0"
  function_app_name = "my-function-app1"
  app_service_plan_name = "my-app-service-name"
  rg_location = azurerm_resource_group.rg.location
  rg_name = azurerm_resource_group.rg.name
  storage_account_name = "mystorageaccount1"
}
```

Create two function apps, using the app service plan and storage account from the first function app:

```
provider "azurerm" {
  version         = "=1.36"
}

resource "azurerm_resource_group" "rg" {
  name     = "test-resource-group"
  location = "East US"
}

module "function-app-1" {
  source  = "dfar-io/function-app/azurerm"
  version = "3.0.0"
  function_app_name = "my-function-app1"
  app_service_plan_name = "my-app-service-name"
  rg_location = azurerm_resource_group.rg.location
  rg_name = azurerm_resource_group.rg.name
  storage_account_name = "mystorageaccount1"
}

module "function-app-2" {
  source  = "dfar-io/function-app/azurerm"
  version = "3.0.0"
  function_app_name = "my-function-app2"
  app_service_plan_id = module.function-app-1.app_service_plan_id
  rg_location = azurerm_resource_group.rg.location
  rg_name = azurerm_resource_group.rg.name
  storage_account_connection_string = module.function-app-1.storage_account_primary_connection_string
}
```
