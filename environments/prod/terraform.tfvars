infrastructure = {
  resource_groups = {
    "rg-nebula-prod" = {
      location = "East US"
      tags = {
        environment = "prod"
      }
    }
  }
  acrs = {
    "acrnebulaprod001" = {
      rg_key        = "rg-nebula-prod"
      sku           = "Premium"
      admin_enabled = true
      georeplications = [
        { location = "West US" }
      ]
    }
  }
  aks_clusters = {
    "aks-prod-001" = {
      rg_key     = "rg-nebula-prod"
      dns_prefix = "aksprod"
      node_count = 3
      vm_size    = "Standard_DS3_v2"
    }
  }
}
