resource "aws_customer_gateway" "main" {
  bgp_asn    = "${var.cgw_bgp_asn}"
  ip_address = "${var.cgw_ip_address}"
  type       = "ipsec.1"

  tags {
    Name         = "${var.cgw_tag_name}"
    Environment  = "${var.cgw_tag_environment}"
    Stack        = "${var.cgw_tag_stack}"
  }
}