# VarFish Docker Compose Configuration

This repository contains the [Docker Compose](https://docs.docker.com/compose/) configuration for the [VarFish Server](https://github.com/bihealth/varfish-server).

## Developer Info

### Managing GitHub Project with Terraform

```
# export GITHUB_OWNER=bihealth
# export GITHUB_TOKEN=ghp_<thetoken>

# cd utils/terraform
# terraform init
# terraform import github_repository.varfish-docker-compose-ng varfish-docker-compose-ng

# terraform validate
# terraform fmt
# terraform plan
# terraform apply
```
