module eks-cluster {
    source = "./modules/eks-cluster"
    project_namespace = var.project_namespace
}

module kubernetes {
    source = "./modules/kubernetes"
    app_name = var.app_name
    container_port = var.container_port
    docker_image = var.docker_image
}