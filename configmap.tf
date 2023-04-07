################################################################################
# aws-auth configmap
################################################################################

locals {

aws_auth_configmap_data = {
    mapRoles = yamlencode(concat(
        [{
        rolearn  = "${aws_iam_role.eks-cluster-test-kb.arn}"
        username = "system:node:{{EC2PrivateDNSName}}"
        groups = [
          "system:bootstrappers",
          "system:nodes",
        ]
        }],
      var.aws_auth_roles
    ))
  }
}

resource "kubernetes_config_map_v1_data" "aws_auth" {
#resource "kubernetes_config_map" "aws_auth" {
 
  force = true
    
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = local.aws_auth_configmap_data

}

##resource "kubernetes_config_map_v1_data" "aws_auth" {
 

