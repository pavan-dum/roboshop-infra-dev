data "aws_ssm_parameter" "backend_alb_sg_id" {
    name = "/${var.project}/${var.Environment}/backend_alb_sg_id"
}

data "aws_ssm_parameter" "private_subnet_ids" {
    name = "/${var.project}/${var.Environment}/private_subnet_ids"
}