#<block> <parameter>{
#    arguments 
#}

terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "example" {
  filename = "demo.txt"
  content  = "Hello from Terraform"
}

# resource = block = block is the container in which creating of that type 
# paramaters =
# 
# local_file = type of resource 
# local = provider => it is plugin 
# 
# when we are making resources of aws then aws is the provider 
# 
# myfile - it is the identifier of resource , referance name for resource 

