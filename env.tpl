# Template for an .env file.

# Postgres configuration ----------------------------------------------------

POSTGRES_USER=varfish
POSTGRES_PASSWORD_FILE=/run/secrets/db-password
POSTGRES_DB=varfish
POSTGRES_HOST=postgres

# VarFish configuration -----------------------------------------------------

DATABASE_URL_FILE="/run/secrets/db-url"

DJANGO_ALLOWED_HOSTS="*"
DJANGO_SECRET_KEY_FILE=/run/secrets/varfish-server-django-secret-key
DJANGO_SETTINGS_MODULE="config.settings.production"

CELERY_BROKER_URL=redis://redis:6379/0

VARFISH_ENABLE_JANNOVAR=1
VARFISH_JANNOVAR_REST_API_URL=http://jannovar:80/

VARFISH_ENABLE_EXOMISER_PRIORITISER=1
VARFISH_ENABLE_EXTRA_ANNOS=1
VARFISH_EXOMISER_PRIORITISER_API_URL=http://exomiser-rest-prioritiser:80/exomiser/api/prioritise/

VARFISH_USE_S3=1
AWS_ACCESS_KEY_ID=varfish
AWS_SECRET_ACCESS_KEY_FILE=/run/secrets/minio-varfish-password
AWS_STORAGE_BUCKET_NAME=varfish-server
AWS_S3_ENDPOINT_URL=http://minio:9000

# Enable experimental beacon site feature by default (has to be configured
# explicitely by the admin anyway).
VARFISH_ENABLE_BEACON_SITE=1

# JS and CSS downloaded from CDN.
PROJECTROLES_DISABLE_CDN_INCLUDES=1

# Backend URL configuration (TODO: should become the default)
VARFISH_BACKEND_URL_NGINX=http://nginx:80
VARFISH_BACKEND_URL_ANNONARS=http://annonars:8080
VARFISH_BACKEND_URL_MEHARI=http://mehari:8080

# Extra: CADD REST API *****************************************************

# Use the following lines to enable variant prioritization using the
# CADD score.  See the VarFish Server manual for installation instructions,
# in particular how to download the required data.
VARFISH_ENABLE_CADD=0
VARFISH_CADD_REST_API_URL=http://cadd-rest-api-server:8080
VARFISH_CADD_MAX_VARS=5000

# Docker entrypoint.sh configuration
GUNICORN_WORKERS=16

# -- Docker Images -----------------------------------------------------------

# Name of the registry server and org to use for our images.
# image_base=ghcr.io/bihealth

# Version of the varfish image to use.
# image_varfish_version=main

# Name of the varfish-server image to use
# image_varfish_name=varfish-server

# Name of the mehari image to use.
# image_mehari_name=mehari

# Version of the mehari image to use.
# image_mehari_version=latest

# Name of the viguno image to use.
# image_viguno_name=viguno

# Version of the viguno image to use.
# image_viguno_version=latest

# Name of the annonars image to use.
# image_annonars_name=annonars

# Version of the annonars image to use.
# image_annonars_version=latest

# Name of the worker image to use.
# image_worker_name=varfish-server-worker

# Version of the worker image to use.
# image_worker_version=latest

# Name of the traefik image to use.
# image_traefik_name=traefik

# Version of the traefik image to use.
# image_traefik_version=2.10

# Name of the postgres image to use.
# image_postgres_name=postgres

# Version of the postgres image to use.
# image_postgres_version=12

# Name of the redis image to use.
# image_redis_name=redis

# Version of the redis image to use.
# image_redis_version=6

# Name of the Minio image to use.
# image_minio_name=quay.io/minio/minio

# Version of the Minio image to use.
# image_minio_version=latest

# Name of the "mc" (Minio client) image to use.
# image_mc_name=bitnami/minio-client

# Version of the "mc" (Minio client) image to use.
# image_mc_version=latest

# Name of the nginx image to use.
# image_nginx_name=nginx

# Version of the nginx image to use.
# image_nginx_version=1

# -- General Container Configuration -----------------------------------------

# Base directory for configuration.
# config_basedir: ./.dev/config

# Base directory for volumes.
# volumes_basedir: ./.dev/volumes

# Base directory for secrets.
# secrets_basedir: ./.dev/secrets
