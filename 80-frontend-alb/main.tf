resource "aws_lb" "frontend_alb" {
  name               = "${var.project}-${var.Environment}-frontend"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [local.frontend_alb_sg_id]
  subnets            = local.private_subnet_ids

  enable_deletion_protection = false



  tags = merge({
    Name = "${var.project}-${var.Environment}-frontend"
  },
  local.common_tags
  )
}



resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = "443"
  protocol          = "HTTPS"

  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = local.frontend_alb_certificate_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "<h1>frontend-alb https working fine</h1>"
      status_code  = "200"
    }
  }
}


resource "aws_route53_record" "frontend_alb" {
  zone_id = var.Zone_id
  name    = "*.${var.Environment}.${var.domain_name}"
  type    = "A"
 
  
  # load balancer details
  alias {
    name = aws_lb.frontend_alb.dns_name
    zone_id = aws_lb.frontend_alb.zone_id
    evaluate_target_health = true
  }
  allow_overwrite = true
}