resource "mongodbatlas_project_ip_access_list" "test" {
  project_id = mongodbatlas_project.aws_atlas.id
  cidr_block = var.atlas_vpc_cidr
  comment    = "cidr block for AWS VPC"
  /*
  aws_security_group = 
  id                 = 
  ip_address         = 
  project_id         = 
  */
}

resource "mongodbatlas_cluster" "cluster-atlas" {
  project_id   = mongodbatlas_project.aws_atlas.id
  name         = var.atlas-cluster-name

  replication_specs {
      num_shards = 1    
    regions_config {
      region_name     = var.region
      electable_nodes = 3
      read_only_nodes = 0
    }
  }

  replication_factor           = 3
  provider_backup_enabled      = true
  auto_scaling_disk_gb_enabled = true
  mongo_db_major_version       = "5.0"

  # Provider Settings "block"
  provider_name               = "AWS"
  disk_size_gb                = 10
  provider_instance_size_name = var.cluster-size-name
  provider_region_name        = var.region
}

resource "mongodbatlas_network_container" "atlas_container" {
  atlas_cidr_block = var.atlas_vpc_cidr
  project_id       = mongodbatlas_project.aws_atlas.id
  provider_name    = "AWS"
  region_name      = var.region
  region           = var.region
  /*
  vpc_id                = 
  azure_subscription_id =
  container_id          = 
  gcp_project_id        = 
  id                    = 
  network_name          = 
  provisioned           = 
  regions               = 
  vnet_name             = 
  */
}

resource "mongodbatlas_network_peering" "aws-atlas" {
  accepter_region_name   = var.region
  project_id             = mongodbatlas_project.aws_atlas.id
  container_id           = mongodbatlas_network_container.atlas_container.container_id
  provider_name          = "AWS"
  route_table_cidr_block = var.atlas_vpc_cidr
  vpc_id                 = var.vpc-id
  aws_account_id         = var.aws_account_id
  atlas_cidr_block       = var.atlas_vpc_cidr
  /*
  atlas_gcp_project_id   = 
  atlas_id               = 
  atlas_vpc_name         = 
  azure_directory_id     = 
  azure_subscription_id  = 
  error_message          = 
  error_state            = 
  error_state_name       = 
  gcp_project_id         = 
  id                     = 
  network_name           = 
  peer_id                = 
  resource_group_name    = 
  status                 = 
  status_name            = 
  vnet_name              = 
  */
}

resource "mongodbatlas_project" "aws_atlas" {
  name   = var.atals-project-name
  org_id = var.atlasorgid
}

resource "mongodbatlas_database_user" "db-user" {
  username           = var.atlas_dbuser
  password           = var.atlas_dbpassword
  auth_database_name = "admin"
  project_id         = mongodbatlas_project.aws_atlas.id
  roles {
    role_name     = "readWrite"
    database_name = "admin"
  }
  depends_on = [mongodbatlas_project.aws_atlas]
}
