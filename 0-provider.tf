provider "aws" {
  region = "eu-west-2"
}

data "aws_eks_cluster" "this" {
  name = "demo"
}

data "aws_eks_cluster_auth" "this" {
  name = "demo"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.this.token
}



variable "cluster_name" {
  default = "demo"
}

variable "cluster_version" {
  default = "1.22"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
      
    }
    
    kubernetes= {
      source  = "hashicorp/kubernetes"
      version = "~> 2.10"  
    }
    
  }
}
