module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.27"

  vpc_id                   = "vpc-placeholder"
  subnet_ids               = ["subnet-placeholder1", "subnet-placeholder2"]
  control_plane_subnet_ids = ["subnet-placeholder1", "subnet-placeholder2"]

  eks_managed_node_groups = {
    mws_nodes = {
      min_size       = 1
      max_size       = 3
      desired_size   = 2
      instance_types = ["t3.medium"]
    }
  }
}