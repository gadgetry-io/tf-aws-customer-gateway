# tf-aws-customer-gateway
Terraform AWS Customer Gateway Module

## Summary
This terraform module creates an AWS Customer Gateway.
- An AWS VPN Gateway and VPN Connection must be provisioned separately.
- Learn More about [AWS VPN Connections](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html)

## Example Implementation

    /project                             # Terraform Project
        /workspaces                      # Workspaces
            /ops                         # Operations Environment
                customer_gateway.<name>  # VPN Gateway Stack using Module
                    backend.tf
                    data.tf
                    main.tf
                    providers.tf
            /dev                         # Development Environment
            /tst                         # Testing Environment
            /stg                         # Staging Environment
            /prd                         # Production Environment

### backend.tf

    terraform {
        backend "s3" {
            bucket               = "<bucket_name>"
            key                  = "customer_gateway_<name>"
            workspace_key_prefix = "terraform"
            region               = "us-east-1"
            profile              = "<profile_name>"
            role_arn             = "arn:aws:iam::<account_id>:role/<role_name>"

### data.tf

    data "terraform_remote_state" "network" {
        backend   = "s3"
        workspace = "${terraform.workspace}"

        config {
            bucket               = "<bucket_name>"
            key                  = "network"
            workspace_key_prefix = "terraform"
            region               = "us-east-1"
            profile              = "<profile_name>"
            role_arn             = "arn:aws:iam::<account_id>:role/<role_name>"
        }
    }

### main.tf

    module "customer_gateway" {
        source                  = "git::ssh://git@github.com/gadgetry-io/tf-aws-customer-gateway.git?ref=master"
        cwg_bgp_asn             = 65000
        cwg_ip_address          = "<e.g. customer gateway_public_ip>"
        cwg_tag_name            = "<e.g. office gateway>"
        cwg_tag_environment     = "<e.g. ${terraform.workspace}>"
        cwg_tag_stack           = "<e.g. customer_gateway.office>"
    }

### providers.tf

    provider aws {
        region  = "us-east-1"
        profile = "<profile_name>"
    }