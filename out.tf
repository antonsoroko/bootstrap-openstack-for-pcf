output "Ops Manager instance IP" {
  value = "${openstack_networking_floatingip_v2.opsmanager.address}"
}

output "PCF Main Network ID" {
  value = "${openstack_networking_network_v2.net01_int.id}"
}

output "PCF Service Network ID" {
  value = "${openstack_networking_network_v2.net02_int.id}"
}
