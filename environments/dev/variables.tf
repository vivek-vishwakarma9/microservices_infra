variable "infrastructure" {
  description = "Infrastructure components for the DEV environment."
  type = object({
    resource_groups = map(object({
      location = string
      tags     = optional(map(string), {})
    }))
    acrs = optional(map(object({
      rg_key          = string
      sku             = optional(string, "Standard")
      admin_enabled   = optional(bool, false)
    })), {})
    aks_clusters = optional(map(object({
      rg_key      = string
      dns_prefix  = string
      node_count  = optional(number, 1) # Smaller default for dev
      vm_size     = optional(string, "Standard_B2s") # Cheaper for dev
    })), {})
  })
}
