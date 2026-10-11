data "oci_core_vnic_attachments" "core_vnic_attachments_lookup" {
  for_each = var.core_vnic_attachments_lookup

  compartment_id      = each.value.compartment_id
  availability_domain = each.value.availability_domain
  instance_id         = each.value.instance_id
  vnic_id             = each.value.vnic_id

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

