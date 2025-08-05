// create-s3-bucket.ts

import { S3Client, CreateBucketCommand } from "@aws-sdk/client-s3";

const bucketName = process.argv[2];
const region = "us-east-1";

if (!bucketName) {
  console.error("Usage: ts-node create-s3-bucket.ts <bucket-name>");
  process.exit(1);
}

const client = new S3Client({ region });

const command = new CreateBucketCommand({
  Bucket: bucketName,
  CreateBucketConfiguration: {
    LocationConstraint: region,
  },
});

client.send(command)
  .then(() => {
    console.log(`Bucket '${bucketName}' created successfully in region '${region}'.`);
  })
  .catch((err) => {
    console.error("Failed to create bucket:", err.message);
  });
