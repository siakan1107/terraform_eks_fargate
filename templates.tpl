apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    ${indent(4, yamlencode(mapRoles))}
  mapUsers: |
    ${indent(4, yamlencode(mapUsers))}
  mapAccounts: |
    ${indent(4, yamlencode(mapAccounts))}
    
 
