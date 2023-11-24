#!/usr/bin/bash

set -x
set -euo pipefail

# Helper startup script for the client.  This script will be called as the
# entrypoint by the Docker Compose file and do the following:
#
# 1. Create an alias "minio" with the root/admin credentials (password
#    comes from `/run/secrets/minio-root-password`).
# 2. Ensure that the user "varfish" exists.  Otherwise, create it with
#    the password from `/run/secrets/minio-varfish-password`)
# 3. Create the "varfish-server" bucket and give "varfish" user access.
# 4. Start a loop that sleeps/does nothing but can be shutdown gracefully.
#
# Root users on the host machine can then attach to this container as
# follows and use the "mc" command to actually configure things, such
# as creating users and buckets for external usage.
#
# ```
# $ docker exec -it minio-client /bin/sh
# ```

# Path to this script.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Auto-cleanedup TMPDIR.
export TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT ERR

# Name of the user to create.
S3_USER=varfish
# Name of the bucket to create.
S3_BUCKET=varfish-server

# 1. Create the alias.
mc alias set minio http://minio:9000 minioadmin $(cat /run/secrets/minio-root-password)

# 2. Ensure that the user "varfish" exists.
users=$(mc admin user list minio | grep -e '^enabled\s+varfish' || true)
if [ "$users" == "" ]; then
    >&2 echo "Creating user '$S3_USER'..."
    mc admin user add minio $S3_USER $(cat /run/secrets/minio-varfish-password)
else
    >&2 echo "User '$S3_USER' already exists"
fi

# 3. Create the "varfish-server" bucket and give "varfish" user access.
buckets=$(mc ls minio | grep -e "$S3_BUCKET/\$" || true)
if [ "$buckets" == "" ]; then
    >&2 echo "Creating bucket '$S3_BUCKET'..."
    mc stat minio/$S3_BUCKET || mc mb minio/$S3_BUCKET

    >&2 echo "Create policy file that provides access for '$S3_USER' to '$S3_BUCKET'..."
    sed -e "s/__BUCKET__/$S3_BUCKET/g" $SCRIPT_DIR/bucket-user-policy.json.tpl \
    > $TMPDIR/$S3_USER-bucket-policy.json

    >&2 echo "Import policy..."
    mc admin policy create minio $S3_USER-bucket-policy $TMPDIR/$S3_USER-bucket-policy.json

    >&2 echo "Attach policy to user..."
    mc admin policy attach minio $S3_USER-bucket-policy --user $S3_USER
else
    >&2 echo "Bucket '$S3_BUCKET' already exists"
fi

# 4. Finally, sleep with graceful shutdown enabled;
set +x; trap exit INT TERM; while true; do sleep 1; done;
