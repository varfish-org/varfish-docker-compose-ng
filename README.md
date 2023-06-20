# VarFish Docker Compose Configuration

This repository contains the [Docker Compose](https://docs.docker.com/compose/) configuration for the [VarFish Server](https://github.com/bihealth/varfish-server).

## Service Information

This section describes the services that are started with this Docker Compose.

### MinIO

[MinIO](https://min.io/) is an S3-compatible object storage server.
The `docker-compose.yml` file will spin up a (single) container with the name `minio` that is used as (a) an internal file storage for VarFish and (b) can be used to upload data into that is then imported by VarFish.

Further, a container `minio-client` is started that you can attach as shown below.
On startup, the `minio-client` container will automatically create a user `varfish` using the secret `minio-varfish-password` as the password.
Further, it will create a bucket `varfish-server` and give read/write access to the bucket for the user `varfish`.
This is the account that VarFish will use to store data in the bucket.

```
$ docker-compose exec -it minio-client bash -i
```

The alias `minio` is pre-configured to point to the MinIO server.
For example

```
host $ docker exec -it minio-client bash -i
[root@minio-client /]# mc ls minio
[2023-06-20 15:09:08 UTC]     0B varfish-server/
[root@minio-client /]# mc admin user ls minio
enabled    varfish               varfish-bucket-po...
[root@minio-client /]# mc admin user info minio  varfish
AccessKey: varfish
Status: enabled
PolicyName: varfish-bucket-policy
MemberOf: []
```

You can create new users, e.g., for uploading data, as follows.
Note that `the-user` corresponds to an S3 access key while `THE_PASSWORD` corresponds to an S3 secret key.

```
host $ docker exec -it minio-client bash -i
[root@minio-client /]# mc mb minio/the-bucket
Bucket created successfully `minio/the-bucket`.
[root@minio-client /]# mc admin user add minio the-user THE_PASSWORD
Added user `the-user` successfully.
[root@minio-client /]# sed -e "s/__BUCKET__/the-bucket/g" \
    /opt/minio-utils/bucket-user-policy.json.tpl \
    > /tmp/the-user-bucket-policy.json
[root@minio-client /]# cat /tmp/the-user-bucket-policy.json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
            "s3:ListBucket",
            "s3:PutObject",
            "s3:GetObject",
            "s3:DeleteObject"
        ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::the-bucket/*", "arn:aws:s3:::the-bucket"
      ],
      "Sid": "BucketAccessForUser"
    }
  ]
}
[root@minio-client /]# mc admin policy create minio the-user-bucket-policy /tmp/the-user-bucket-policy.json
Created policy `the-user-bucket-policy` successfully.
[root@minio-client /]# mc admin policy attach minio the-user-bucket-policy --user the-user
Attached Policies: [the-user-bucket-policy]
To User: the-user
```

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
