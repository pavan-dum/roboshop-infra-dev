locals {

    common_tags = {
        
        terraform = "true"
        Environment = var.Environment
        Project = var.project
    }

    backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.value
    private_subnet_ids = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
}