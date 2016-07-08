.DEFAULT_GOAL := push

.PHONY: apply
apply: pull
	terraform apply

.PHONY: clean
clean:
	rm -rf .terraform

.PHONY: destroy
destroy:
	terraform destroy

.PHONY: pull
pull: remote
	terraform remote pull

.PHONY: push
push: apply
	terraform remote push

.PHONY: remote
remote: terraform
	terraform remote config -backend-config="bucket=imaging-platform-terraform-state-production" -backend-config="key=terraform.tfstate" -backend=s3

terraform: terraform_0.6.16_linux_amd64.zip
	mkdir -p $@
	unzip $< -d $@

terraform_0.6.16_linux_amd64.zip:
	wget https://releases.hashicorp.com/terraform/0.6.16/$@
