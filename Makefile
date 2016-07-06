.DEFAULT_GOAL := imaging.plan

.PHONY: apply
apply: imaging.plan
	terraform apply $<

.PHONY: clean
clean:
	git clean -dfx

.PHONY: destroy
destroy:
	terraform destroy -force

imaging.plan: imaging.tf
	terraform plan -out $@
