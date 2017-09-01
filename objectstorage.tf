resource "openstack_objectstorage_container_v1" "pcf" {
  name   = "pcf"
  region = "${var.region}"
}

resource "openstack_objectstorage_container_v1" "pcf-buildpacks-bucket" {
  name   = "pcf-buildpacks-bucket"
  region = "${var.region}"
}

resource "openstack_objectstorage_container_v1" "pcf-droplets-bucket" {
  name   = "pcf-droplets-bucket"
  region = "${var.region}"
}

resource "openstack_objectstorage_container_v1" "pcf-packages-bucket" {
  name   = "pcf-packages-bucket"
  region = "${var.region}"
}

resource "openstack_objectstorage_container_v1" "pcf-resources-bucket" {
  name   = "pcf-resources-bucket"
  region = "${var.region}"
}
