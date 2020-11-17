## Initializes the terraform backend
terraform-init:
	@rm -rf .terraform/*.tf*
	@terraform init

## Runs a plan. Note that in Terraform < 0.7.0 this can create state entries.
terraform-plan:
	@terraform plan -input=false -refresh=true

## Applies a new state.
terraform-apply:
	@terraform apply -input=false -refresh=true -auto-approve

## Shows what a destroy would do.
terraform-plan-destroy:
	@terraform plan -destroy -input=false -refresh=true

## Destroys targets
terraform-destroy:
	@terraform destroy -refresh=true -auto-approve
