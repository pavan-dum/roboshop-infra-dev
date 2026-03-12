resource "aws_instance" "catalogue" {

  ami = local.ami_id
  instance_type = "t3.micro"
  subnet_id = local.private_subnet_id
  vpc_security_group_ids = [local.catalogue_sg_id]
  

  tags = merge(
    {Name = "${var.project}-${var.Environment}-catalogue"},
  
  local.common_tags
  )
   
}

resource "terraform_data" "bootstrap_catalogue" {
  triggers_replace = [
    aws_instance.catalogue.id
  ]

connection {
    type ="ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = aws_instance.catalogue.private_ip
  }

provisioner "file" {
  source = "bootstrap.sh" # local file path
  destination = "/tmp/bootstrap.sh"   # destination path on the rempote machine
}

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh catalogue ${var.Environment}"]
  }
}