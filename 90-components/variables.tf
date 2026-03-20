variable "components" {
    default = {
        catalogue = {
            rule_priority = 10
        }
        user = {
            rule_priority = 20
        }
        cart = {
            rule_priority = 30
        }
        shipping = {
            rule_priority = 40
        }
        payment = {
            rule_priority = 50
        }
        frontend = {
            rule_priority = 10
        }
    }
}


variable "project" {
    default = "roboshop"
}

variable "Environment" {
    default = "dev"
}


variable "Zone_id" {
    default = "Z02160638EY77GSSE3BP"
}

variable "domain_name" {
    default = "dpavan.online"
}


