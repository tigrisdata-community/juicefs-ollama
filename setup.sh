#!/bin/bash

juicefs format \
    --storage s3 \
    --bucket $AWS_ENDPOINT_URL_S3/$BUCKET_NAME \
    --access-key $AWS_ACCESS_KEY_ID \
    --secret-key $AWS_SECRET_ACCESS_KEY \
    $DATABASE_URL \
    juicefs-fly

echo "Mounting JuiceFS to /root/.ollama"
juicefs mount --prefetch=256 --buffer-size=12288 -d $DATABASE_URL /root/.ollama

/bin/ollama serve
