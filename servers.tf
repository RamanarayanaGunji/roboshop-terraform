
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
//Creation of instances by calling for_each

 resource "aws_instance" "instance" {
   for_each      =var.components
   //count         =length(var.components)
   ami           =data.aws_ami.centos.image_id
   instance_type = each.value["instance_type"]
   vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

   tags = {
     Name = each.value["name"]
   }
 }

// Creation of DNS records

resource "aws_route53_record" "records" {
    for_each   =var.components
    zone_id= "Z08051092LKB6WUQCW0K4"

    //id taken from domain tab itself (edit hosted zone itself)
##above case we are printing just variable combination of some strings then following is the syntax.output
## ${} is compulsory f we include the variable inside a string
    name= "${each.value["name"]}.devopsb72r.online"
    type= "A"
    ttl= 30  //300 to 30
    // here 2nd instance belongs to instance function name at 60th line one.
    records= [aws_instance.instance[each.value["name"]].private_ip]
}




