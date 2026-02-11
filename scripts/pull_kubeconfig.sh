export KUBECONFIG="/Users/agluck/.kube/il5-staging.conf"
rm -rf $KUBECONFIG
aws --profile pb-il5-prod eks update-kubeconfig --region us-gov-west-1 --name pb-il5-staging-mdo-0009

export KUBECONFIG="/Users/agluck/.kube/il5-prod.conf"
rm -rf $KUBECONFIG
aws --profile pb-il5-prod eks update-kubeconfig --region us-gov-west-1 --name pb-il5-prod-mdo-0015

export KUBECONFIG="/Users/agluck/.kube/il4-staging.conf"
rm -rf $KUBECONFIG
aws --profile il2-il4-prod eks update-kubeconfig --region us-gov-west-1 --name pb-il4-staging-mdo-0008

export KUBECONFIG="/Users/agluck/.kube/il4-prod.conf"
rm -rf $KUBECONFIG
aws --profile il2-il4-prod eks update-kubeconfig --region us-gov-west-1 --name pb-il4-prod-mdo-0014

export KUBECONFIG="/Users/agluck/.kube/il2-staging.conf"
rm -rf $KUBECONFIG
aws --profile il2-il4-prod eks update-kubeconfig --region us-gov-west-1 --name pb-il2-staging-mdo-0007

export KUBECONFIG="/Users/agluck/.kube/il2-prod.conf"
rm -rf $KUBECONFIG
aws --profile il2-il4-prod eks update-kubeconfig --region us-gov-west-1 --name pb-il2-prod-mdo-0013
