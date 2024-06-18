# Changelog

## 1.0.0 (2024-06-18)


### Features

* add gnomAD SV/CNV 4.0 for GRCh38 ([#55](https://github.com/varfish-org/varfish-docker-compose-ng/issues/55)) ([48ba90d](https://github.com/varfish-org/varfish-docker-compose-ng/commit/48ba90df75be22dabbc8aecdba74130b73609d38))
* add MinIO server for file storage purposes ([#2](https://github.com/varfish-org/varfish-docker-compose-ng/issues/2)) ([#7](https://github.com/varfish-org/varfish-docker-compose-ng/issues/7)) ([34b37c4](https://github.com/varfish-org/varfish-docker-compose-ng/commit/34b37c4a7fdbb487036779068fc78507981747c5))
* add traefik service with configuration examples ([#3](https://github.com/varfish-org/varfish-docker-compose-ng/issues/3)) ([#5](https://github.com/varfish-org/varfish-docker-compose-ng/issues/5)) ([8cfbc21](https://github.com/varfish-org/varfish-docker-compose-ng/commit/8cfbc21cccdf3508335deb9ebe6eefb96ee49a3f))
* adding cadd-rest-api support via docker-compose.override.yml ([#48](https://github.com/varfish-org/varfish-docker-compose-ng/issues/48)) ([c9d6c6c](https://github.com/varfish-org/varfish-docker-compose-ng/commit/c9d6c6c1f5f16a3f069ce0722efc1d6e078bbbd4))
* adding ClinVar download instructions to README ([#28](https://github.com/varfish-org/varfish-docker-compose-ng/issues/28)) ([d4ead82](https://github.com/varfish-org/varfish-docker-compose-ng/commit/d4ead82594a74544a50c59850ac60ee78f043d57))
* adding download-data.sh script ([#42](https://github.com/varfish-org/varfish-docker-compose-ng/issues/42)) ([1f6fca8](https://github.com/varfish-org/varfish-docker-compose-ng/commit/1f6fca8287b9d0c43fb8ab3716dd4cdd99a378db))
* adding nginx for serving track data ([#15](https://github.com/varfish-org/varfish-docker-compose-ng/issues/15)) ([#20](https://github.com/varfish-org/varfish-docker-compose-ng/issues/20)) ([973b640](https://github.com/varfish-org/varfish-docker-compose-ng/commit/973b6400f93199dd3d6c39e9226a874cdf3fbf05))
* adding templates for exomiser integration ([#46](https://github.com/varfish-org/varfish-docker-compose-ng/issues/46)) ([dea2c78](https://github.com/varfish-org/varfish-docker-compose-ng/commit/dea2c787324960b8da64ddf283ef76e1a43f8323))
* bump annonars/genes ([#58](https://github.com/varfish-org/varfish-docker-compose-ng/issues/58)) ([d3cf847](https://github.com/varfish-org/varfish-docker-compose-ng/commit/d3cf847ef7416f14cf207f1540bf7afd4aae4d1d))
* bump downloader to be on par with reev one ([#57](https://github.com/varfish-org/varfish-docker-compose-ng/issues/57)) ([a8c02e3](https://github.com/varfish-org/varfish-docker-compose-ng/commit/a8c02e3ed2e3309dc3b839b40e45c017aafa04b5))
* bumping annonars, clinvar data, adding clinvar-genes ([#29](https://github.com/varfish-org/varfish-docker-compose-ng/issues/29)) ([fbdcaf1](https://github.com/varfish-org/varfish-docker-compose-ng/commit/fbdcaf15bf255a0ed94edac50e1a62529631b752))
* splitting download into more steps ([#75](https://github.com/varfish-org/varfish-docker-compose-ng/issues/75)) ([a6c4737](https://github.com/varfish-org/varfish-docker-compose-ng/commit/a6c47374be92893edad8af1df201e3f84ac3d668))


### Bug Fixes

* adding s3:GetBucketLocation to minio policy ([#30](https://github.com/varfish-org/varfish-docker-compose-ng/issues/30)) ([9e94ad0](https://github.com/varfish-org/varfish-docker-compose-ng/commit/9e94ad09a9ed6410105b23d2f760fbc48c29ebf6))
* adding viguno env setup ([c5c759a](https://github.com/varfish-org/varfish-docker-compose-ng/commit/c5c759a4cb05186257bd8c5804f25b06962f4d0e))
* allow graceful shutdown of minio-client container ([#21](https://github.com/varfish-org/varfish-docker-compose-ng/issues/21)) ([575c07e](https://github.com/varfish-org/varfish-docker-compose-ng/commit/575c07e9c5d34ad4009abb1cfe82531277d6d139))
* bump mehari-data-tx to 0.6.0 ([#59](https://github.com/varfish-org/varfish-docker-compose-ng/issues/59)) ([3ffacf9](https://github.com/varfish-org/varfish-docker-compose-ng/commit/3ffacf900db0f5d04f03f26aff20a7bbb84d52ea))
* docker-compose.override.yml file for certificate ([#72](https://github.com/varfish-org/varfish-docker-compose-ng/issues/72)) ([a076d3f](https://github.com/varfish-org/varfish-docker-compose-ng/commit/a076d3ff2e97beb8417954ea191795d4158f8d70))
* docker-compose.override.yml for cadd-rest-api ([#73](https://github.com/varfish-org/varfish-docker-compose-ng/issues/73)) ([ce3a7df](https://github.com/varfish-org/varfish-docker-compose-ng/commit/ce3a7df00f8d81ca96460555d89bf75f2b6858c0))
* Fix download script variable names ([#61](https://github.com/varfish-org/varfish-docker-compose-ng/issues/61)) ([73d88db](https://github.com/varfish-org/varfish-docker-compose-ng/commit/73d88db3786d38919b83f5ec8cb5c4e1bfe8c69c))
* mehari freqs path ([#70](https://github.com/varfish-org/varfish-docker-compose-ng/issues/70)) ([6fb8dcb](https://github.com/varfish-org/varfish-docker-compose-ng/commit/6fb8dcb287dde5c7996931d1f3c88a232e1a0fdd))
* putting BOT_TOKEN into release-please GitHub actions workflow ([#68](https://github.com/varfish-org/varfish-docker-compose-ng/issues/68)) ([049d3df](https://github.com/varfish-org/varfish-docker-compose-ng/commit/049d3df114ba4df672e605595fd1a319898bda0f))
* seqdup =&gt; segdup ([083c66f](https://github.com/varfish-org/varfish-docker-compose-ng/commit/083c66fdfe20ed6e985c52109e2ffc5e3eebe4de))
* update readme ([#41](https://github.com/varfish-org/varfish-docker-compose-ng/issues/41)) ([7b53228](https://github.com/varfish-org/varfish-docker-compose-ng/commit/7b53228d4e870ac944970287b49e04f7eb29769e))
* updating cadd-rest-api.env example file ([#50](https://github.com/varfish-org/varfish-docker-compose-ng/issues/50)) ([81eeb8a](https://github.com/varfish-org/varfish-docker-compose-ng/commit/81eeb8a22de4f6d2e017780b4e5e86231fd3e969))
* using bitnami minio clients to startup works again ([#36](https://github.com/varfish-org/varfish-docker-compose-ng/issues/36)) ([7e199f3](https://github.com/varfish-org/varfish-docker-compose-ng/commit/7e199f373d57ef9d97c38e1367a63fbac95c876b))

## Changelog
