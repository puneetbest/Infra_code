resource "azurerm_resource_group" "rg" {
  for_each = var.resource
  name     = each.key
  location = each.value
}

resource "azurerm_kubernetes_cluster" "aks" {
  for_each            = var.azkuberser
  name                = each.key
  location            = azurerm_resource_group.rg[each.value.rg_name].location
  resource_group_name = azurerm_resource_group.rg[each.value.rg_name].name
  dns_prefix          = each.value.dns

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DC2ads_v5"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_postgresql_flexible_server" "axion" {
  for_each               = var.postgresqlser
  name                   = each.key
  resource_group_name    = azurerm_resource_group.rg[each.value.rg_name].name
  location               = each.value.location
  version                = each.value.version
  administrator_login    = each.value.admin_login
  administrator_password = each.value.admin_password
  storage_mb             = each.value.storage
  sku_name               = "GP_Standard_D4s_v3"
}

resource "azurerm_postgresql_flexible_server_database" "database" {
  for_each  = var.postgresdb
  name      = each.key
  server_id = azurerm_postgresql_flexible_server.axion[each.value.server_name].id
  collation = "en_US.utf8"
  charset   = "UTF8"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}

