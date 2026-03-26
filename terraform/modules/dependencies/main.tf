# Dependencies: DB/Queue/Storage - conditional

resource "aws_db_instance" "db" {
  count              = var.deps_enabled["db"] && var.cloud_provider == "aws" ? 1 : 0
  allocated_storage  = 20
  engine             = var.db_type
  instance_class     = "db.t3.micro"
  # Connect string output
}

# TODO: Redis (queue), S3/GCS/Blob (storage), multi-cloud
