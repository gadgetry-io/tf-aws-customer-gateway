resource "local_file" "readme" {
  content  = "${data.template_file.readme.rendered}"
  filename = "${path.module}/README.${upper(terraform.workspace)}.md"
}

data "template_file" "readme" {
  template = <<EOF
# ${var.stack_name}
This stack provisions the ${upper(terraform.workspace)} ${upper(var.stack_name)} Stack.

## ${var.stack_name}

Key notes about this Stack:
- This stack creates an AWS AWS Customer Gateway.

## LINKS
[AWS VPN Connections](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html)


### CUSTOMER GATEWAY CONFIGURATION

|ATTRIBUTE|VALUE|
|Customer Gateway ID|${aws_customer_gateway.main.id}|
|Customer Gateway BGP ASN|${aws_customer_gateway.main.bgp}|
|Customer Gateway IP Address|${aws_customer_gateway.main.ip_address}|
|Customer Gateway Type|${aws_customer_gateway.main.type}|

EOF
}
