infrastructure = {
  resource_groups = {
    "rg-nebula-dev" = {
      location = "East US"
      tags = {
        environment = "dev"
      }
    }
  }
  acrs = {
    "acrnebuladev001" = {
      rg_key = "rg-nebula-dev"
      sku    = "Basic"
    }
  }
  aks_clusters = {
    "aks-dev-001" = {
      rg_key     = "rg-nebula-dev"
      dns_prefix = "aksdev"
      node_count = 1
      vm_size    = "Standard_B2s"
    }
  }
}
