locals {

    common_tags = {
        
        terraform = "true"
        Environment = var.Environment
        Project = var.project
    }
}