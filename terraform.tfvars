resource_group_name  = "rg-dev-storage"
location             = "Central India"
storage_account_name = "stdevstorage12345"

replication_type = "LRS"

container_name = "data"

tags = {
  environment = "dev"
  project     = "terraform-demo"
  managed_by  = "terraform"
}
