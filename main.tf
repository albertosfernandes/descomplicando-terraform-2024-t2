
resource "aws_key_pair" "aws_terraform_ssh_key" {
  key_name = "aws_terraform_ssh_key"
  public_key = var.aws_terraform_ssh_key
}

resource "aws_security_group" "terraform_sg_allow_home" {
  name = "terraform_sg_allow_home"
  description = "Permite acesso a EC2 a partir do ip da minha casa"
  tags = {
    Name = "terraform_sg_allow_home"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.terraform_sg_allow_home.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  for_each = toset(var.my_ip_pub)
  security_group_id = aws_security_group.terraform_sg_allow_home.id
  from_port = 22
  to_port = 22
  ip_protocol = "tcp"
  cidr_ipv4 = each.value
}
resource "aws_instance" "vm1" {
  ami = var.image_id_aws
  instance_type = data.aws_ami.aws_ami_id.image_id
}