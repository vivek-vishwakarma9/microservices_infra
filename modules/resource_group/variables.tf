variable "resource_groups" {
  description = "A map of resource groups to create. Key is the RG name."
  type = map(object({
    location = string
    tags     = optional(map(string), {})
  }))
}
