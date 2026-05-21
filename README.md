# terraform


Terraform

acquire by IBM 

infrastructure = infra 

IAC - infrastructure as a code 

EC2 => virtual machine / server 

Aurora and RDS => relational database service

elastic kubernetes service => cluster 

VPC => network

to avoid Manunal creation of infra help terraform

why IAC 

**terraform and ansible diff

do automate the infrastructure 

terraform => create (provision) infrastructure 


ansible iAC CFM  - configuration management => for manage, update this will done in ansible => manage , update of those publuc and private resources that are created from terraform  

** terraform and cloudFormation diff

terraform will create all thing docker conatianer , cluster , namespace, serviceaccount, secret 

cloudFormation(create and mange Resources with templates ) is a terrform for aws 


---** 

ec2 
aws - ec2
azure- virtual machine / VM 
GCP - compute engine 

s3 

aws - s3
azure- block storage 
GCP - 

all providers help to create infra (resources/services)


Terraform HCL (hashiCorp configurationLanguage )

entesion => .tf 

<block> <parameter>{

----arguments 

}

block =>

create infra = resource 
show output = output 
store variable = variable 
provider 
module 

parameter =>

type and name of resoure 


------Teraform WorkFlow ----

make file first in below format with entension .tf 

<block> <parameter>{

----arguments 

}

initialiazation of terraform inside the folder made env only one time 

  >terraform init 

validate the configuration 

  >terraform validate 

Planning show how does the output (dry run output)
  >terraform plan 

Final ouput 
 
  > terraform apply 
  without yes and no use -auto-approve 
  >terraform apply -auto-approve

want to delete 
 
  > terraform destory
  > terraform destory -auto-approve


create teaarform_aws_provider 
terraform provide us tools  to connect with aws 

for connecting to account - need aws ali 
browse - install aws cli and install vai command 

chcek => aws --version

*** configure aws cli 

local and aws connection => aws cli 
aws configure 
 need access key ID 
from below steps get access key and paste and we have secret access key and paste
in aws use IAM  => create user => attach plicies => get access id from security credentails of that user => create access key => use cli => create access key













