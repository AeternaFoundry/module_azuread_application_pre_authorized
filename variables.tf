variable "application_pre_authorizeds" {
  description = <<EOT
Map of application_pre_authorizeds, attributes below
Required:
    - application_id
    - authorized_client_id
    - permission_ids
EOT

  type = map(object({
    application_id       = string
    authorized_client_id = string
    permission_ids       = set(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.application_pre_authorizeds : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.authorized_client_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_pre_authorizeds : (
        alltrue([for x in v.permission_ids : can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", x))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

