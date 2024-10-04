# Overview
This provisions an EKS cluster and deploys a simple HTTP web app on to the cluster.

- `modules/eks-cluster` module handles bringing up the EKS cluster and related infrastructure (such as a VPC)
- `modules/kubernetes` handles bringing up the Kubernetes deployment and services.

This way everything is handled by Terraform - no `kubectl` commands are needed to provision the web app.

The web app will be publically hosted at the top level of an existing domain (see below), and can be tested at the url given in the Terraform output `app_url`.

## Prerequisites
You should own a domain and have a hosted zone for that domain in AWS Route 53

You will need to know the Zone ID of your hosted zone (inspect the hosted zone in the AWS console)

You will also need to know the load balancer zone id for the AWS region you are deploying to, which you can find [here](https://docs.aws.amazon.com/general/latest/gr/elb.html) under classic load balancers.

# Terraform Docs
made by terraform-docs

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.9.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=5.69.0 |
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement\_cloudinit) | >=2.3.5 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >=2.6.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >=3.2.3 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >=3.6.3 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >=0.12.1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >=4.0.6 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks-cluster"></a> [eks-cluster](#module\_eks-cluster) | ./modules/eks-cluster | n/a |
| <a name="module_kubernetes"></a> [kubernetes](#module\_kubernetes) | ./modules/kubernetes | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Name for k8s hosted web app | `string` | `"godbound-dice-roller"` | no |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | Port for k8s hosted web app | `number` | `5000` | no |
| <a name="input_docker_image"></a> [docker\_image](#input\_docker\_image) | Docker image for k8s hosted web app | `string` | `"dbartramdockerhub/godbound-dice-roller:latest"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name for Route53 hosted zone that you have already set up | `string` | n/a | yes |
| <a name="input_hosted_zone_id"></a> [hosted\_zone\_id](#input\_hosted\_zone\_id) | Hosted zone ID for Route53 hosted zone that you have already set up | `string` | n/a | yes |
| <a name="input_lb_zone_id"></a> [lb\_zone\_id](#input\_lb\_zone\_id) | Zone ID for load balancer, look up in classic load balancers by region at https://docs.aws.amazon.com/general/latest/gr/elb.html | `string` | n/a | yes |
| <a name="input_profile"></a> [profile](#input\_profile) | AWS profile | `string` | `"tf-deploy"` | no |
| <a name="input_project_namespace"></a> [project\_namespace](#input\_project\_namespace) | namespace for project, to use for unique resource naming | `string` | `"TestEksProject"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"eu-west-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_url"></a> [app\_url](#output\_app\_url) | Public url of web app |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Endpoint for EKS control plane |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Kubernetes Cluster Name |
| <a name="output_cluster_security_group_id"></a> [cluster\_security\_group\_id](#output\_cluster\_security\_group\_id) | Security group ids attached to the cluster control plane |
<!-- END_TF_DOCS -->