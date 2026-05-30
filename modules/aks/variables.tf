variable "clusters" {
  description = "A map of AKS clusters to create."
  type = map(object({
    resource_group_name = string
    location            = string
    dns_prefix          = string
    kubernetes_version  = optional(string)
    tags                = optional(map(string), {})
    
    default_node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
      zones      = optional(list(string))
    })

    identity = optional(object({
      type = string
    }), { type = "SystemAssigned" })
  }))
}
