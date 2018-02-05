#!/bin/bash

# Files are hosted on package-json-validator.com using S3
d=$1
if [ "$1" == "" ]; then 
    echo "Pass the directory as an argument"
    exit 1
fi

if [ ! -d "$d" ] ; then
    echo "$d is not a directory"
    exit 1
fi

s3cmd sync --acl-public --recursive $d/ s3://$d
