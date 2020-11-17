output "nbsp_db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.nbsp-db.nbsp_db_instance_address
}

output "nbsp_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.nbsp-db.nbsp_db_instance_arn
}

output "nbsp_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.nbsp-db.nbsp_db_instance_availability_zone
}

output "nbsp_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.nbsp-db.nbsp_db_instance_endpoint
}

output "nbsp_db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.nbsp-db.nbsp_db_instance_hosted_zone_id
}

output "nbsp_db_instance_id" {
  description = "The RDS instance ID"
  value       = module.nbsp-db.nbsp_db_instance_id
}

output "nbsp_db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.nbsp-db.nbsp_db_instance_resource_id
}

output "nbsp_db_instance_status" {
  description = "The RDS instance status"
  value       = module.nbsp-db.nbsp_db_instance_status
}

output "nbsp_db_instance_name" {
  description = "The database name"
  value       = module.nbsp-db.nbsp_db_instance_name
}

output "nbsp_db_instance_username" {
  description = "The master username for the database"
  value       = module.nbsp-db.nbsp_db_instance_username
}

output "nbsp_db_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = module.nbsp-db.nbsp_db_instance_password
}

output "nbsp_db_instance_port" {
  description = "The database port"
  value       = module.nbsp-db.nbsp_db_instance_port
}

output "this_db_subnet_group_id" {
  description = "The db subnet group name"
  value       = module.nbsp-db.this_db_subnet_group_id
}

output "this_db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = module.nbsp-db.this_db_subnet_group_arn
}

output "this_db_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.nbsp-db.this_db_parameter_group_id
}

output "this_db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = module.nbsp-db.this_db_parameter_group_arn
}