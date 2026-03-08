module "vpc" {
    source = "git::https://github.com/pavan-dum/terraform-aws-vpc.git?ref=main"
    project = var.project
    Environment = var.Environment
    is_peering_required = true
}