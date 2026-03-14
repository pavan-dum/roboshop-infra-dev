locals {

    common_tags = {
        
        terraform = "true"
        Environment = var.Environment
        Project = var.project
    }
    
    ami_id = data.aws_ami.rhel_id.id
    catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
    private_subnet_id = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    backend_alb_listener_arn = = data.aws_ssm_parameter.backend_alb_listener_arn.value
}