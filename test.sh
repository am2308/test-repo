#!/bin/bash

# Variables
BUCKET_NAME=$1
REGION="us-east-1"  # Change as needed

# Check if bucket name is provided
if [ -z "$BUCKET_NAME" ]; then
  echo "Usage: ./create_s3_bucket.sh <bucket-name>"
  exit 1
fi

# Create the S3 bucket
aws s3api create-bucket \
  --bucket "$BUCKET_NAME" \
  --region "$REGION" \
  --create-bucket-configuration LocationConstraint="$REGION"

# Confirm
if [ $? -eq 0 ]; then
  echo "Bucket '$BUCKET_NAME' created successfully in region '$REGION'."
else
  echo "Failed to create bucket."
fi

