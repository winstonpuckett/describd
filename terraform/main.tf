provider "azurerm" {
  version = "~>2.0"
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name = "describd-rg"
  location = "westus2"
}

# Application Insights
resource "azurerm_application_insights" "example" {
  name                = "describd-appinsights"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
# output "instrumentation_key" {
#   value = azurerm_application_insights.example.instrumentation_key
# }
# output "app_id" {
#   value = azurerm_application_insights.example.app_id
# }


# Storage Account
resource "azurerm_storage_account" "sa" {
  name                     = "describdsa"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Function App
resource "azurerm_function_app" "fn" {
  # TODO: Test if you really need app service plan with consumption. If so, just remove this.
  name                       = "test-azure-functions"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
  https_only                 = true
}

# APIM
resource "azurerm_api_management" "apim" {
  name                = "describd-apim"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = "TODO"
  publisher_email     = "TODO"

  sku_name = "Consumption"
}