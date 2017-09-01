resource "openstack_compute_instance_v2" "opsmanager" {

  name = "opsmanager"

  image_id = "${var.image_id}"

  flavor_name = "m1.large"

  key_pair = "${var.opsman_pub_key_name}"

  network = {
    uuid = "${openstack_networking_network_v2.net01_int.id}"
  }

  availability_zone = "${var.az}"

  security_groups = [
    "${openstack_compute_secgroup_v2.opsmanager.name}",
    "${openstack_compute_secgroup_v2.ping.name}"
  ]

}

resource "openstack_compute_floatingip_associate_v2" "opsmanager_fip" {
  floating_ip = "${openstack_networking_floatingip_v2.opsmanager.address}"
  instance_id = "${openstack_compute_instance_v2.opsmanager.id}"
}
