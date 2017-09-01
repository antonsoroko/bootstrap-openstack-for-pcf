variable "user_name" {}

variable "domain_name" {}

variable "pass" {}

variable "tenant_name" {}

variable "auth_url" {}

variable "insecure" {}

variable "region" {}

variable "pcf_pub_key" {}

variable "opsman_pub_key_name" {}

variable "image_id" {}

variable "ext_net_id" {}

variable "ext_net_name" {}

variable "network" {
  default = "192.168.113.0/24"
}

variable "network_service" {
  default = "192.168.114.0/24"
}

variable "dns" {
  default = {
   "1" = "8.8.8.8"
   "2" = "8.8.4.4"
  }
}

variable "az" {
  default = "nova"
}

resource "openstack_compute_keypair_v2" "pcf-key" {
  name = "pcf"
  public_key = "${file("${var.pcf_pub_key}")}"
}
