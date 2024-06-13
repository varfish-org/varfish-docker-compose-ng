# VarFish Docker Compose Configuration

This repository contains the [Docker Compose](https://docs.docker.com/compose/) configuration for the [VarFish Server](https://github.com/varfish-org/varfish-server).

## Development Setup

This section describes the steps needed for a development setup.

### Prerequites

You will need to fetch some of this from our S3 server.
We recommend the `s5cmd` tool as it is easy to install, use, and fast.
You can download it from [github.com/peak/s5cmd/releases](https://github.com/peak/s5cmd/releases).
For example:

```bash session
wget -O /tmp/s5cmd_2.1.0_Linux-64bit.tar.gz \
    https://github.com/peak/s5cmd/releases/download/v2.1.0/s5cmd_2.1.0_Linux-64bit.tar.gz
tar -C /tmp -xf /tmp/s5cmd_2.1.0_Linux-64bit.tar.gz
sudo cp /tmp/s5cmd /usr/local/bin/
```

You will need to install Docker Compose.
Note that the "modern" way is to do this by using the docker compose plugin.
Instructions can be found [here on the Docker.com website](https://docs.docker.com/compose/install/linux/#install-using-the-repository).

### Checkout and Configure

First, clone the repository:

```bash session
git clone git@github.com:varfish-org/varfish-docker-compose-ng.git
```

From here on, the commands should be executed from within this repository (`cd varfish-docker-compose-ng`).

We will use the directory `.dev` within the checkout for storing data and secrets.
In a production deployment, these directories should live outside of the checkout, of course.

Now, we create the directories for data storage.

```bash session
mkdir -p .dev/volumes/{minio,varfish-static}/data
```

Next, we setup some "secrets" for the passwords.

```bash session
mkdir -p .dev/secrets
echo password >.dev/secrets/db-password
echo postgresql://varfish:password@postgres/varfish >.dev/secrets/db-url
echo minio-root-password >.dev/secrets/minio-root-password
echo minio-varfish-password >.dev/secrets/minio-varfish-password
```

Also, setup a secret for the web server sessions:

```bash session
# ensure that pwgen is installed first
pwgen
# generate a 100 character secret
pwgen 100 1 >.dev/secrets/varfish-server-django-secret-key
```

We now copy the `env.tpl` file to the default location for the environment `.env`.

```bash session
cp env.tpl .env
```

Next, create a `docker-compose.override.yml` with the contents of the file `docker-compose.override.yml-dev`.
This will disable everything that we assume is running on your host when you are developing.
This includes the VarFish web server, redis, celery workers, postgres.

```bash session
cp docker-compose.override.yml-dev docker-compose.override.yml
```

### Download Dev Data

Now you need to obtain the data to serve by the mehari, viguno, and annonars container.
For this, we have prepared strongly reduced data sets (overall less than 2GB rather than hundreds of GB of data).
We provide a script for this.

```
bash download-data.sh
```

### Setup Configuration

The next step step is to create the configuration files in `.dev/config`.

```bash session
mkdir -p .dev/config/nginx
cp utils/nginx/nginx.conf .dev/config/nginx
```

### Startup and Check

Now, you can bring up the docker compose environment (stop with `Ctrl+C`).

```bash session
docker compose up
```

To verify the results, have a look at the following URLs:

- Annonars database infos: http://127.0.0.1:3001/annos/db-info?genome_release=grch37
- Annonars gene info: http://0.0.0.0:3001/genes/info?hgnc_id=HGNC:12403
- Annonars variant info: http://0.0.0.0:3001/annos/variant?genome_release=grch37&chromosome=17&pos=41244100&reference=G&alternative=A
- Mehari impact prections: http://127.0.0.1:3002/tx/csq?genome-release=grch37&chromosome=17&position=48275363&reference=C&alternative=A
- Viguno for TGDS: http://127.0.0.1:3003/hpo/genes?gene_symbol=TGDS
- Nginx server with browser tracks http://127.0.0.1:3004/

Note that the development subset only has variants for a few genes, including BRCA1 (the example above).

You should also be able to access the MinIO console on:

- http://localhost:3011/login

The admin user is `minioadmin` and the password is stored in `.dev/secrets/minio-root-password`.

## Service Information

This section describes the services that are started with this Docker Compose.

### Trafik

[Traefik](https://traefik.io/traefik/) is a reverse proxy that is used as the main entry point for all services behind HTTP(S).
The software is well-documented by its creators.
However, it is central to the setup and for much of the additional setup, touching Trafik configuraiton is needed.
We thus summarize some important points here.

- Almost all configuration is done using labels on the `traefik` container itself or other containers.
- In the case of using configuration files, you will have to mount them from the host into the container.
- By default, we use "catch-all" configuration based on regular expressions on the host/domain name.

### Mehari

Mehari (by the VarFish authors) provides information about variants and their effect on individual transcripts.

### Viguno

Viguno (by the VarFish authors) provides HPO/OMIM related information.

### Annonars

Annonars (by the VarFish authors) provides variant annotation from public databases.

### Postgres

We use postgres for the database backend of VarFish.

### Redis

The Redis database is used for key-value store, e.g., for caching and the queues in the VarFish server.

### MinIO

[MinIO](https://min.io/) is an S3-compatible object storage server.
The `docker-compose.yml` file will spin up a (single) container with the name `minio` that is used as (a) an internal file storage for VarFish and (b) can be used to upload data into that is then imported by VarFish.

Further, a container `minio-client` is started that you can attach as shown below.
On startup, the `minio-client` container will automatically create a user `varfish` using the secret `minio-varfish-password` as the password.
Further, it will create a bucket `varfish-server` and give read/write access to the bucket for the user `varfish`.
This is the account that VarFish will use to store data in the bucket.

```bash session
$ docker-compose exec -it minio-client bash -i
```

The alias `minio` is pre-configured to point to the MinIO server.
For example

```bash session
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

```bash session
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
        "arn:aws:s3:::the-bucket/*",
        "arn:aws:s3:::the-bucket"
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

```bash session
$ export GITHUB_OWNER=varfish-org
$ export GITHUB_TOKEN=ghp_<thetoken>

$ cd utils/terraform
$ terraform init
$ terraform import github_repository.varfish-docker-compose-ng varfish-docker-compose-ng

$ terraform validate
$ terraform fmt
$ terraform plan
$ terraform apply
```
