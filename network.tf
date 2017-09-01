resource "openstack_networking_network_v2" "net01_int" {
  name = "net01_int"
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "net02_int" {
  name = "net02_int"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "nw-113" {
  name = "nw-113"
  network_id = "${openstack_networking_network_v2.net01_int.id}"
  cidr = "${var.network}"
  ip_version = 4
  dns_nameservers = [
    "${var.dns[1]}",
    "${var.dns[2]}"
  ]
}

resource "openstack_networking_subnet_v2" "nw-114" {
  name = "nw-114"
  network_id = "${openstack_networking_network_v2.net02_int.id}"
  cidr = "${var.network_service}"
  ip_version = 4
  dns_nameservers = [
    "${var.dns[1]}",
    "${var.dns[2]}"
  ]
}

resource "openstack_networking_router_v2" "rtr" {
  name = "rtr"
  external_gateway = "${var.ext_net_id}"
  admin_state_up = "true"
  region = "${var.region}"
}

resource "openstack_networking_router_interface_v2" "to_113" {
  router_id = "${openstack_networking_router_v2.rtr.id}"
  subnet_id = "${openstack_networking_subnet_v2.nw-113.id}"
}

resource "openstack_networking_router_interface_v2" "to_114" {
  router_id = "${openstack_networking_router_v2.rtr.id}"
  subnet_id = "${openstack_networking_subnet_v2.nw-114.id}"
}

resource "openstack_networking_floatingip_v2" "opsmanager" {
  pool = "${var.ext_net_name}"
}
