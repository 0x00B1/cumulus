.DEFAULT_GOAL := imaging.plan

.PHONY: apply
apply: imaging.plan remote
	terraform apply $<

.PHONY: clean
clean:
	rm imaging.plan

.PHONY: destroy
destroy:
	terraform destroy

imaging.plan: imaging.tf
	terraform plan -out $@

.PHONY: remote
remote:
	terraform remote config -backend-config="bucket=imaging-platform-terraform-state-production" -backend-config="key=terraform.tfstate" -backend=s3
