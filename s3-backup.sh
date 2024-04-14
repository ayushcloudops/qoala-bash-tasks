#!/bin/sh

echo " Do you want only to sync or delete the files that do not sync :- 1 (only sync/) / 2 (Delete also)): "
read $a
if [ $a == 1];
then
    aws s3 sync s3://<source-bucket> s3://<backup-bucket>/backup-$(date +"%Y-%m-%d_%H-%M-%S")
    if [ $? -eq 0 ]; then
        echo "Backup completed successfully."
    else
        echo "Backup failed. Please check the AWS CLI configuration and try again."
    fi
else
    aws s3 sync s3://<source-bucket> s3://<backup-bucket>/backup-$(date +"%Y-%m-%d_%H-%M-%S") --delete
        if [ $? -eq 0 ]; then
        echo "Backup completed successfully."
    else
        echo "Backup failed. Please check the AWS CLI configuration and try again."
    fi
fi
