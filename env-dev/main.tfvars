app_servers={
      frontend ={
       name="frontend"
       instance_type="t3.small"
      }
       catalogue ={
         name="catalogue"
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

        shipping ={
           name="shipping"
           instance_type="t3.medium"
        }
        payment ={
          name="payment"
          instance_type="t3.small"
        }
}

env="dev"

database_servers ={

     mongodb ={
        name="mongodb"
        instance_type="t3.small"
     }
     mysql ={
        name="mysql"
        instance_type="t3.small"
     }
     rabbitmq ={
        name="rabbitmq"
        instance_type="t3.small"
     }
     redis ={
        name="redis"
        instance_type="t3.small"
     }
}