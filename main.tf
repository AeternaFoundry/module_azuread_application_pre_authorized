resource "azuread_application_pre_authorized" "application_pre_authorizeds" {
  for_each = var.application_pre_authorizeds

  application_id       = each.value.application_id
  authorized_client_id = each.value.authorized_client_id
  permission_ids       = each.value.permission_ids

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

