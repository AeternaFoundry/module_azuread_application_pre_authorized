variable "application_pre_authorizeds" {
  description = <<EOT
Map of application_pre_authorizeds, attributes below
Required:
    - application_id
    - authorized_client_id
    - permission_ids
Optional:
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    application_id       = string
    authorized_client_id = string
    permission_ids       = set(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.application_pre_authorizeds : (
        can(regex("^(/[^/]+/[^/]+)+$", v.application_id))
      )
    ])
    error_message = "must be a valid Azure resource ID"
  }
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
}

