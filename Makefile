.DEFAULT_GOAL := apply

.PHONY: apply
apply: remote
	terraform apply

.PHONY: clean
clean:
	rm -rf .terraform

.PHONY: destroy
destroy:
	terraform destroy

.PHONY: remote
remote:
	terraform remote config -backend-config="bucket=imaging-platform-terraform-state-production" -backend-config="key=terraform.tfstate" -backend=s3
