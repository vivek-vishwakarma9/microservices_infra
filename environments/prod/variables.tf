variable "infrastructure" {
  description = "Infrastructure components for the PROD environment."
  type = object({
    resource_groups = map(object({
      location = string
      tags     = optional(map(string), {})
    }))
    acrs = optional(map(object({
      rg_key          = string
      sku             = optional(string, "Premium")
      admin_enabled   = optional(bool, true)
      georeplications = optional(list(object({
        location = string
      })))
    })), {})
    aks_clusters = optional(map(object({
      rg_key      = string
      dns_prefix  = string
      node_count  = optional(number, 3)
      vm_size     = optional(string, "Standard_DS3_v2")
    })), {})
  })
}
