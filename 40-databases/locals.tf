locals {
    common_tags = {
        
        terraform = "true"
        Environment = var.Environment
        Project = var.project
    }

    ami_id = data.aws_ami.rhel_id.id

    # we will get db subnet in 1a AZ
    database_subnet_id = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]
    mongodb_sg_id=data.aws_ssm_parameter.mongodb_sg_id.value
    redis_sg_id=data.aws_ssm_parameter.redis_sg_id.value



 

}