data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project}/${var.Environment}/vpc_id"
}