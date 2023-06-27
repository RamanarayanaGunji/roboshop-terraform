
data "aws_ami" "centos" {
  owners = ["973714476881"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  }

  output "ami" {
  value=data.aws_ami.centos.image_id
  }
 data "aws_security_group"  "allow-all" {
      name ="allow-all"
 }

variable "components"{
    default ={
      frontend ={
       name="frontend"
       instance_type="t3.small"
      }
      mongodb ={
       name="mongodb"
        instance_type="t3.small"
      }
       catalogue ={
         name="catalogue"
          instance_type="t3.small"
       }
       redis ={
          name="redis"
          instance_type="t3.small"
       }
       user ={
        name="user"
         instance_type="t3.micro"
        }
        cart ={
          name="cart"
          instance_type="t3.micro"
        }
        mysql ={
          name="mysql"
          instance_type="t3.small"
        }
        shipping ={
           name="shipping"
           instance_type="t3.medium"
        }
        rabbitmq ={
           name="rabbitmq"
           instance_type="t3.small"
        }

        payment ={
          name="payment"
          instance_type="t3.small"
        }
    }
}
 resource "aws_instance" "instance" {
   for_each      =var.components
   count         =length(var.components)
   ami           =data.aws_ami.centos.image_id
   instance_type = each.value["instance_type"]
   vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

   tags = {
     Name = for.value["name"]
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

