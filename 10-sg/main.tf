module "sg" {
    count = length(var.sg_names)
    source = "../../terraform-aws-sg"
    project = var.project
    Environment = var.Environment
    sg_name = replace(var.sg_names[count.index], "_", "-")
    vpc_id = local.vpc_id
}