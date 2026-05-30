module "resource_groups" {
  source          = "../../modules/resource_group"
  resource_groups = var.infrastructure.resource_groups
}

module "acrs" {
  source = "../../modules/acr"
  acrs = {
    for k, v in var.infrastructure.acrs : k => {
      resource_group_name = module.resource_groups.names[v.rg_key]
      location            = module.resource_groups.locations[v.rg_key]
      sku                 = v.sku
      admin_enabled       = v.admin_enabled
      georeplications     = v.georeplications
    }
  }
  depends_on = [module.resource_groups]
}

module "aks" {
  source = "../../modules/aks"
  clusters = {
    for k, v in var.infrastructure.aks_clusters : k => {
      resource_group_name = module.resource_groups.names[v.rg_key]
      location            = module.resource_groups.locations[v.rg_key]
      dns_prefix          = v.dns_prefix
      default_node_pool = {
        name       = "default"
        node_count = v.node_count
        vm_size    = v.vm_size
      }
    }
  }
  depends_on = [module.resource_groups]
}
