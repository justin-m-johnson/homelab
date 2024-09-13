#!/bin/bash

BACKUP_WORLD_NAME=$1
BACKUP_DIR=$2
BUCKET=$3
BACKUP_TAR_DIR=$4
BACKUP_TAR="${BACKUP_TAR_DIR}/${BUCKET}.tgz"

tar -zc -f $BACKUP_TAR -C $BACKUP_DIR "$BACKUP_WORLD_NAME" "${BACKUP_WORLD_NAME}_nether" "${BACKUP_WORLD_NAME}_the_end"
aws s3 mb "s3://$BUCKET/"
aws s3api put-bucket-versioning --bucket "$BUCKET" --versioning-configuration Status=Enabled
aws s3api put-bucket-lifecycle-configuration --bucket "$BUCKET" --lifecycle-configuration "file:///usr/local/share/minecraft-s3-backup-lifecycle.json"
aws s3 cp $BACKUP_TAR "s3://$BUCKET/"

rm $BACKUP_TAR
