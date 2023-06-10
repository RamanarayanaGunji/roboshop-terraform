
data "aws_ami" "centos" {
  owners = ["973714476881"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  }

  //output "ami" {
  //value=data.aws_ami.centos.image_id

 // }

resource "aws_instance" "frontend" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"
  }
}

//output "frontend" {
 //value = aws_instance.frontend.public_ip
//}

resource "aws_route53_record" "frontend" {
  zone_id = "Z08051092LKB6WUQCW0K4"
  // zone id taken from domain tab itself (edit hosted zone itself)
  name    = "frontend.devopsb72r.online"
  type    = "A"
  ttl     = 30  //300 to 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mongodb" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "mongodb"
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = "Z08051092LKB6WUQCW0K4"
  // zone id taken from domain tab itself (edit hosted zone itself)
  name    = "mongodb.devopsb72r.online"
  type    = "A"
  ttl     = 30  //300 to 30
  records = [aws_instance.mongodb.private_ip]
}

resource "aws_instance" "catalogue" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z08051092LKB6WUQCW0K4"
  // zone id taken from domain tab itself (edit hosted zone itself)
  name    = "catalogue.devopsb72r.online"
  type    = "A"
  ttl     = 30  //300 to 30
  records = [aws_instance.catalogue.private_ip]
}

resource "aws_instance" "redis" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "redis"
  }
}

resource "aws_route53_record" "redis" {
  zone_id = "Z08051092LKB6WUQCW0K4"
  // zone id taken from domain tab itself (edit hosted zone itself)
  name    = "redis.devopsb72r.online"
  type    = "A"
  ttl     = 30  //300 to 30
  records = [aws_instance.redis.private_ip]
}

resource "aws_instance" "user" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "user"
  }
}

resource "aws_route53_record" "user" {
  zone_id = "Z08051092LKB6WUQCW0K4"
  // zone id taken from domain tab itself (edit hosted zone itself)
  name    = "user.devopsb72r.online"
  type    = "A"
  ttl     = 30  //300 to 30
  records = [aws_instance.user.private_ip]
}

resource "aws_instance" "cart" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "cart"
  }
}

resource "aws_route53_record" "cart" {
  zone_id = "Z08051092LKB6WUQCW0K4"
  // zone id taken from domain tab itself (edit hosted zone itself)
  name    = "cart.devopsb72r.online"
  type    = "A"
  ttl     = 30  //300 to 30
  records = [aws_instance.cart.private_ip]
}

resource "aws_instance" "mysql" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "mysql"
  }
}

resource "aws_instance" "shipping" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "shipping"
  }
}

resource "aws_route53_record" "shipping" {
  zone_id = "Z08051092LKB6WUQCW0K4"
  // zone id taken from domain tab itself (edit hosted zone itself)
  name    = "shipping.devopsb72r.online"
  type    = "A"
  ttl     = 30  //300 to 30
  records = [aws_instance.shipping.private_ip]
}

resource "aws_instance" "rabbitmq" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "rabbitmq"
  }
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z08051092LKB6WUQCW0K4"
  // zone id taken from domain tab itself (edit hosted zone itself)
  name    = "rabbitmq.devopsb72r.online"
  type    = "A"
  ttl     = 30  //300 to 30
  records = [aws_instance.rabbitmq.private_ip]
}

resource "aws_instance" "payment" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "payment"
  }
}

resource "aws_route53_record" "payment" {
  zone_id = "Z08051092LKB6WUQCW0K4"
  // zone id taken from domain tab itself (edit hosted zone itself)
  name    = "payment.devopsb72r.online"
  type    = "A"
  ttl     = 30  //300 to 30
  records = [aws_instance.payment.private_ip]
}