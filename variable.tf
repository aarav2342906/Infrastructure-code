variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Globally unique Azure Storage Account name"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "Storage account name must be 3-24 characters and contain only lowercase letters and numbers."
  }
}

variable "replication_type" {
  description = "Storage replication type"
  type        = string
  default     = "LRS"

  validation {
    condition = contains(
      ["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"],
      var.replication_type
    )

    error_message = "Invalid replication type."
  }
}

variable "container_name" {
  description = "Blob container name"
  type        = string
  default     = "data"
}

variable "tags" {
  description = "Tags to apply to Azure resources"
  type        = map(string)

  default = {
    environment = "dev"
    managed_by  = "terraform"
  }
}
