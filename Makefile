.DEFAULT_GOAL := default

.PHONY: clean
clean: destroy
	rm imaging.plan terraform.tfstate.backup

.PHONY: default
default: imaging.plan
	terraform apply $<

.PHONY: destroy
destroy:
	terraform destroy -force

imaging.plan: imaging.tf
	terraform plan -out $@
