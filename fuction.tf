provider "azurerm" {
  features {}
}

resource "azurerm_function_app" "start_stop_vm_app" {
  name                      = var.function_start-stop
  location                  = var.location
  resource_group_name       = var.resource_group
  app_service_plan_id       = azurerm_app_service_plan.service_plan.id
  storage_account_name      = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
}

resource "azurerm_function_app" "start_vm_app" {
  # Defina a função para iniciar a VM aqui
}

resource "azurerm_function_app" "stop_vm_app" {
  # Defina a função para parar a VM aqui
}

resource "azurerm_app_service_plan" "service_plan" {
  name                = "service_plan_start-stop"
  location            = var.location
  resource_group_name = var.resource_group
  kind                = "FunctionApp"
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestorageaccount"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}