output "resource_group_name" {
  description = "Resource Group name"
  value       = azurerm_resource_group.this.name
}

output "storage_account_name" {
  description = "Storage Account name"
  value       = azurerm_storage_account.this.name
}

output "storage_account_id" {
  description = "Storage Account resource ID"
  value       = azurerm_storage_account.this.id
}

output "primary_blob_endpoint" {
  description = "Primary Blob endpoint"
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "container_name" {
  description = "Blob container name"
  value       = azurerm_storage_container.this.name
}
