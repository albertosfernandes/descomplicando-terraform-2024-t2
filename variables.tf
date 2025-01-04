data "aws_ami" "aws_ami_id" {
    filter {
      name = "image-id"
      values = [ "ami-005fc0f236362e99f" ]
    }
}

variable "aws_access_key" {
    type = string
    description = "Access key da conta AWS"  
}

variable "aws_secret_key" {
  type = string
  description = "Secret key da conta AWS"
}

variable "image_id_aws" {
    type = string
    description = "Imagem utilizada para criar VM"
    default = "ami-0453ec754f44f9a4a"
}

variable "aws_terraform_ssh_key" {
  type = string
  description = "Chave ssh conexão com EC2 criada pelo terraform"  
}

variable "instance_type_aws" {
    type = string
    description = "Tipo da instancia para criar VM"
    default = "t3.micro"
}

variable "my_ip_pub" {
  type = list(string)
  description = "Meu ip público para criação de regra no security group"  
}