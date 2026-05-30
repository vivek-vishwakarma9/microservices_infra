infrastructure = {
  resource_groups = {
    "rg-nebula-prod" = {
      location = "East US"
      tags = {
        environment = "prod"
      }
    }
  }
  acrs         = {}
  aks_clusters = {}
}
