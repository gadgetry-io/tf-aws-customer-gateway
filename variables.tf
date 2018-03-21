# STACK VARIABLES
variable stack_name {
  type = "string"
  default = "customer_gateway"
}

# CUSTOMER GATEWAY VARIABLES (cgw)
variable cwg_bgp_asn {
  default = 65000
}

variable cwg_ip_address {
  type = "string"
}

variable cwg_tag_name {
  type = "string"
}

variable cwg_tag_environment {
  type = "string"
}

variable cwg_tag_stack {
  type = "string"
  default = "customer_gateway
}