output "application_pre_authorizeds_id" {
  description = "Map of id values across all application_pre_authorizeds, keyed the same as var.application_pre_authorizeds"
  value       = { for k, v in azuread_application_pre_authorized.application_pre_authorizeds : k => v.id if v.id != null && length(v.id) > 0 }
}
output "application_pre_authorizeds_application_id" {
  description = "Map of application_id values across all application_pre_authorizeds, keyed the same as var.application_pre_authorizeds"
  value       = { for k, v in azuread_application_pre_authorized.application_pre_authorizeds : k => v.application_id if v.application_id != null && length(v.application_id) > 0 }
}
output "application_pre_authorizeds_authorized_client_id" {
  description = "Map of authorized_client_id values across all application_pre_authorizeds, keyed the same as var.application_pre_authorizeds"
  value       = { for k, v in azuread_application_pre_authorized.application_pre_authorizeds : k => v.authorized_client_id if v.authorized_client_id != null && length(v.authorized_client_id) > 0 }
}
output "application_pre_authorizeds_permission_ids" {
  description = "Map of permission_ids values across all application_pre_authorizeds, keyed the same as var.application_pre_authorizeds"
  value       = { for k, v in azuread_application_pre_authorized.application_pre_authorizeds : k => v.permission_ids if v.permission_ids != null && length(v.permission_ids) > 0 }
}

