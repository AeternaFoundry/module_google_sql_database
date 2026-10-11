variable "sql_databases" {
  description = <<EOT
Map of sql_databases, attributes below
Required:
    - instance
    - name
Optional:
    - charset
    - collation
    - deletion_policy
    - project
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    instance        = string
    name            = string
    charset         = optional(string)
    collation       = optional(string)
    deletion_policy = optional(string)
    project         = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

