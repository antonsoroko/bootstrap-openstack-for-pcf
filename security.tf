resource "openstack_compute_secgroup_v2" "ping" {
  name = "ping"
  description = "allow PING from eveywhere"

  rule {
    from_port = -1
    to_port = -1
    ip_protocol = "icmp"
    cidr = "0.0.0.0/0"
  }
}

resource "openstack_compute_secgroup_v2" "opsmanager" {
  name = "opsmanager"
  description = "OPS Manager"

  rule {
    from_port = -1
    to_port = -1
    ip_protocol = "icmp"
    cidr = "0.0.0.0/0"
  }

  rule {
    from_port = 443
    to_port = 443
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }

  rule {
    from_port = 80
    to_port = 80
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }

  rule {
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }

  rule {
    from_port = 25555
    to_port = 25555
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }

  rule {
    from_port = 2222
    to_port = 2222
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }

  rule {
    from_port = 4443
    to_port = 4443
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }

  rule {
    from_port = 1
    to_port = 65535
    ip_protocol = "tcp"
    self = true
  }

  rule {
    from_port = 1
    to_port = 65535
    ip_protocol = "udp"
    self = true
  }

}

