#!/bin/bash

BUCKET=$1
BACKUP_DIR=$2
BACKUP_TAR="/tmp/$BUCKET.tgz"

tar -zc -f $BACKUP_TAR $BACKUP_DIR
aws s3 mb "s3://$BUCKET/"
aws s3api put-bucket-versioning --bucket "$BUCKET" --versioning-configuration Status=Enabled
aws s3api put-bucket-lifecycle-configuration --bucket "$BUCKET" --lifecycle-configuration "file:///usr/local/share/mercurial-s3-backup-lifecycle.json"
aws s3 cp $BACKUP_TAR "s3://$BUCKET/"

rm $BACKUP_TAR
