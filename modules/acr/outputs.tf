output "acrs" {
  description = "The created ACR objects."
  value       = azurerm_container_registry.this
}

output "login_servers" {
  description = "Map of ACR login servers."
  value       = { for k, v in azurerm_container_registry.this : k => v.login_server }
}
