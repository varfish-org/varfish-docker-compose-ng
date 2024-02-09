# Changelog

## 1.0.0 (2024-02-09)


### Features

* add MinIO server for file storage purposes ([#2](https://www.github.com/varfish-org/varfish-docker-compose-ng/issues/2)) ([#7](https://www.github.com/varfish-org/varfish-docker-compose-ng/issues/7)) ([34b37c4](https://www.github.com/varfish-org/varfish-docker-compose-ng/commit/34b37c4a7fdbb487036779068fc78507981747c5))
* add traefik service with configuration examples ([#3](https://www.github.com/varfish-org/varfish-docker-compose-ng/issues/3)) ([#5](https://www.github.com/varfish-org/varfish-docker-compose-ng/issues/5)) ([8cfbc21](https://www.github.com/varfish-org/varfish-docker-compose-ng/commit/8cfbc21cccdf3508335deb9ebe6eefb96ee49a3f))
* adding cadd-rest-api support via docker-compose.override.yml ([#48](https://www.github.com/varfish-org/varfish-docker-compose-ng/issues/48)) ([c9d6c6c](https://www.github.com/varfish-org/varfish-docker-compose-ng/commit/c9d6c6c1f5f16a3f069ce0722efc1d6e078bbbd4))
* adding ClinVar download instructions to README ([#28](https://www.github.com/varfish-org/varfish-docker-compose-ng/issues/28)) ([d4ead82](https://www.github.com/varfish-org/varfish-docker-compose-ng/commit/d4ead82594a74544a50c59850ac60ee78f043d57))
* adding download-data.sh script ([#42](https://www.github.com/varfish-org/varfish-docker-compose-ng/issues/42)) ([1f6fca8](https://www.github.com/varfish-org/varfish-docker-compose-ng/commit/1f6fca8287b9d0c43fb8ab3716dd4cdd99a378db))
* adding nginx for serving track data ([#15](https://www.github.com/varfish-org/varfish-docker-compose-ng/issues/15)) ([#20](https://www.github.com/varfish-org/varfish-docker-compose-ng/issues/20)) ([973b640](https://www.github.com/varfish-org/varfish-docker-compose-ng/commit/973b6400f93199dd3d6c39e9226a874cdf3fbf05))
* adding templates for exomiser integration ([#46](https://www.github.com/varfish-org/varfish-docker-compose-ng/issues/46)) ([dea2c78](https://www.github.com/varfish-org/varfish-docker-compose-ng/commit/dea2c787324960b8da64ddf283ef76e1a43f8323))
* bumping annonars, clinvar data, adding clinvar-genes ([#29](https://www.github.com/varfish-org/varfish-docker-compose-ng/issues/29)) ([fbdcaf1](https://www.github.com/varfish-org/varfish-docker-compose-ng/commit/fbdcaf15bf255a0ed94edac50e1a62529631b752))


### Bug Fixes

* adding s3:GetBucketLocation to minio policy ([#30](https://www.github.com/varfish-org/varfish-docker-compose-ng/issues/30)) ([9e94ad0](https://www.github.com/varfish-org/varfish-docker-compose-ng/commit/9e94ad09a9ed6410105b23d2f760fbc48c29ebf6))
* allow graceful shutdown of minio-client container ([#21](https://www.github.com/varfish-org/varfish-docker-compose-ng/issues/21)) ([575c07e](https://www.github.com/varfish-org/varfish-docker-compose-ng/commit/575c07e9c5d34ad4009abb1cfe82531277d6d139))
* update readme ([#41](https://www.github.com/varfish-org/varfish-docker-compose-ng/issues/41)) ([7b53228](https://www.github.com/varfish-org/varfish-docker-compose-ng/commit/7b53228d4e870ac944970287b49e04f7eb29769e))
* updating cadd-rest-api.env example file ([#50](https://www.github.com/varfish-org/varfish-docker-compose-ng/issues/50)) ([81eeb8a](https://www.github.com/varfish-org/varfish-docker-compose-ng/commit/81eeb8a22de4f6d2e017780b4e5e86231fd3e969))
* using bitnami minio clients to startup works again ([#36](https://www.github.com/varfish-org/varfish-docker-compose-ng/issues/36)) ([7e199f3](https://www.github.com/varfish-org/varfish-docker-compose-ng/commit/7e199f373d57ef9d97c38e1367a63fbac95c876b))
