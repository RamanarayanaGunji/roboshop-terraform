
data "aws_ami" "centos" {
  owners = ["973714476881"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  }

  //output "ami" {
  //value=data.aws_ami.centos.image_id
 // }
 data "aws_security_group"  "selected" {
      name ="allow-all"
 }

 variable "instance_type" {
    default ="t3.micro"
 }

Variable “components” {
Default =[“frontend”, “mongodb”, “catalogue”]
}

 resource "aws_instance" "instance" {
   count =length(var.components)
   ami           = data.aws_ami.centos.image_id
   instance_type = var.instance_type
   vpc_security_group_ids = [data.aws_security_group.allow.all.id]

   tags = {
     Name = var.components[count.index]
   }
 }

//"aws_route53_record" "frontend" {
// = "Z08051092LKB6WUQCW0K4"
// id taken from domain tab itself (edit hosted zone itself)
// = "frontend.devopsb72r.online"
// = "A"
// = 30  //300 to 30
// = [aws_instance.frontend.private_ip]
//

//"frontend" {
//= aws_instance.frontend.public_ip
//

//"aws_instance" "mongodb" {
//       = data.aws_ami.centos.image_id
//e_type = var.instance_type
//urity_group_ids = [data.aws_security_group.allow.all.id]

//{
//= "mongodb"
//
//

//"aws_route53_record" "mongodb" {
// = "Z08051092LKB6WUQCW0K4"
// id taken from domain tab itself (edit hosted zone itself)
// = "mongodb.devopsb72r.online"
// = "A"
// = 30  //300 to 30
// = [aws_instance.mongodb.private_ip]
//

//"aws_instance" "catalogue" {
//       = data.aws_ami.centos.image_id
//e_type = "t3.micro"
//urity_group_ids = [data.aws_security_group.allow.all.id]

//{
//= "catalogue"
//
//

//"aws_route53_record" "catalogue" {
// = "Z08051092LKB6WUQCW0K4"
// id taken from domain tab itself (edit hosted zone itself)
// = "catalogue.devopsb72r.online"
// = "A"
// = 30  //300 to 30
// = [aws_instance.catalogue.private_ip]
//

//"aws_instance" "redis" {
//       = data.aws_ami.centos.image_id
//e_type = var.instance_type
//urity_group_ids = [data.aws_security_group.allow.all.id]

//{
//= "redis"
//
//

//"aws_route53_record" "redis" {
// = "Z08051092LKB6WUQCW0K4"
// id taken from domain tab itself (edit hosted zone itself)
// = "redis.devopsb72r.online"
// = "A"
// = 30  //300 to 30
// = [aws_instance.redis.private_ip]
//

//"aws_instance" "user" {
//       = data.aws_ami.centos.image_id
//e_type = var.instance_type
//urity_group_ids = [data.aws_security_group.allow.all.id]

//{
//= "user"
//
//

//"aws_route53_record" "user" {
// = "Z08051092LKB6WUQCW0K4"
// id taken from domain tab itself (edit hosted zone itself)
// = "user.devopsb72r.online"
// = "A"
// = 30  //300 to 30
// = [aws_instance.user.private_ip]
//

//"aws_instance" "cart" {
//       = data.aws_ami.centos.image_id
//e_type = var.instance_type
//urity_group_ids = [data.aws_security_group.allow.all.id]

//{
//= "cart"
//
//

//"aws_route53_record" "cart" {
// = "Z08051092LKB6WUQCW0K4"
// id taken from domain tab itself (edit hosted zone itself)
// = "cart.devopsb72r.online"
// = "A"
// = 30  //300 to 30
// = [aws_instance.cart.private_ip]
//

//"aws_instance" "mysql" {
//       = data.aws_ami.centos.image_id
//e_type = var.instance_type
//urity_group_ids = [data.aws_security_group.allow.all.id]

//{
//= "mysql"
//
//

//"aws_route53_record" "mysql" {
// = "Z08051092LKB6WUQCW0K4"
// id taken from domain tab itself (edit hosted zone itself)
// = "mysql.devopsb72r.online"
// = "A"
// = 30  //300 to 30
// = [aws_instance.mysql.private_ip]
//

//"aws_instance" "shipping" {
//       = data.aws_ami.centos.image_id
//e_type = var.instance_type
//urity_group_ids = [data.aws_security_group.allow.all.id]

//{
//= "shipping"
//
//

//"aws_route53_record" "shipping" {
// = "Z08051092LKB6WUQCW0K4"
// id taken from domain tab itself (edit hosted zone itself)
// = "shipping.devopsb72r.online"
// = "A"
// = 30  //300 to 30
// = [aws_instance.shipping.private_ip]
//

//"aws_instance" "rabbitmq" {
//       = data.aws_ami.centos.image_id
//e_type = var.instance_type
//urity_group_ids = [data.aws_security_group.allow.all.id]

//{
//= "rabbitmq"
//
//

//"aws_route53_record" "rabbitmq" {
// = "Z08051092LKB6WUQCW0K4"
// id taken from domain tab itself (edit hosted zone itself)
// = "rabbitmq.devopsb72r.online"
// = "A"
// = 30  //300 to 30
// = [aws_instance.rabbitmq.private_ip]
//

//"aws_instance" "payment" {
//       = data.aws_ami.centos.image_id
//e_type = var.instance_type
//urity_group_ids = [data.aws_security_group.allow.all.id]

//{
//= "payment"
//
//

//"aws_route53_record" "payment" {
// = "Z08051092LKB6WUQCW0K4"
// id taken from domain tab itself (edit hosted zone itself)
// = "payment.devopsb72r.online"
// = "A"
// = 30  //300 to 30
// = [aws_instance.payment.private_ip]
//