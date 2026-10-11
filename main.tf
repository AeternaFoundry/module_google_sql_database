resource "google_sql_database" "sql_databases" {
  for_each = var.sql_databases

  instance        = each.value.instance
  name            = each.value.name
  charset         = each.value.charset
  collation       = each.value.collation
  deletion_policy = each.value.deletion_policy
  project         = each.value.project

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

