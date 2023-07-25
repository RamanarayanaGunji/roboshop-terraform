// Ansible roboshop starts

module "database_servers"{
 for_each = var.database_servers

 source = "./module"
 component_name = each.value["name"]
 env = var.env
 instance_type = each.value["instance_type"]
 password = lookup(each.value, "password", "null")
 provisioner = true
}

module "app_servers" {
  depends_on =[module.database_servers]
  for_each = var.app_servers

  source = "./module"
  component_name = each.value["name"]
  env = var.env
  instance_type = each.value["instance_type"]
  password = lookup(each.value, "password", "null")
}

































  //output "ami" {
  //value=data.aws_ami.centos.image_id
 // }
//variable "components"{}
//Creation of instances by calling for_each

 //resource "aws_instance" "instance" {
  //for_each      =var.components
   ////count         =length(var.components)
   //ami           =data.aws_ami.centos.image_id
   //instance_type = each.value["instance_type"]
   //vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

   //tags = {
     //Name = each.value["name"]
   //}
 //}

//// Creation of DNS records

//resource "aws_route53_record" "records" {
    //for_each   =var.components
    //zone_id= "Z08051092LKB6WUQCW0K4"

  //  //id taken from domain tab itself (edit hosted zone itself)
////##above case we are printing just variable combination of some strings then following is the syntax.output
////## ${} is compulsory f we include the variable inside a string
    //name= "${each.value["name"]}.devopsb72r.online"
    //type= "A"
    //ttl= 30  //300 to 30
    //// here 2nd instance belongs to instance function name at 60th line one.
  //  records= [aws_instance.instance[each.value["name"]].private_ip]
//}




