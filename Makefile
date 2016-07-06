.DEFAULT_GOAL := imaging.plan

.PHONY: apply
apply: imaging.plan
	terraform apply $<

.PHONY: clean
clean:
	rm imaging.plan

.PHONY: destroy
destroy:
	terraform destroy

imaging.plan: imaging.tf
	terraform plan -out $@
