###############################################################################
# Customer Gateway Outputs.

output "cgw_id" {
  value = "${aws_customer_gateway.main.id}"
}

output "cgw_bgp_asn" {
  value = "${aws_customer_gateway.main.bgp_asn}"
}

output "cgw_ip_address" {
  value = "${aws_customer_gateway.main.ip_address}"
}

output "cgw_type" {
  value = "${aws_customer_gateway.main.type}"
}
