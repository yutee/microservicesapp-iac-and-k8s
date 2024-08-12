resource "helm_release" "nginx_ingress" {
  name       = "ingress-nginx"
  namespace  = "ingress-nginx"
  create_namespace = true
  chart      = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  version    = "4.7.1"
  wait    = true
  timeout = 600
}

# resource "helm_release" "prometheus_stack" {
#   name       = "prometheus-stack"
#   namespace  = "monitoring"
#   create_namespace = true
#   chart      = "kube-prometheus-stack"
#   repository = "https://prometheus-community.github.io/helm-charts"
#   version    = "45.6.0"
#   wait    = true
#   timeout = 600

#   set {
#     name  = "grafana.adminPassword"
#     value = "admin"
#   }
# }

resource "helm_release" "grafana" {
  name       = "grafana"
  namespace  = "monitoring"
  chart      = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  version    = "6.16.0"
  wait    = true
  timeout = 600

  set {
    name  = "adminPassword"
    value = "admin"
  }
  
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  namespace  = "monitoring"
  chart      = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  version    = "15.4.0"
  wait = true
  timeout = 600
}