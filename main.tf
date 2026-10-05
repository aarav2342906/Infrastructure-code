resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier              = "Standard"
  account_replication_type = var.replication_type

  account_kind = "StorageV2"

  # Security
  https_traffic_only_enabled = true
  min_tls_version            = "TLS1_2"

  # Prevent anonymous public access
  allow_nested_items_to_be_public = false

  # Recommended security settings
  shared_access_key_enabled = true

  tags = var.tags
}

resource "azurerm_storage_container" "this" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.this.id
  container_access_type = "private"
}
