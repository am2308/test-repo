#!/usr/bin/env ruby

require 'open3'

# Get the bucket name from command line
bucket_name = ARGV[0]
region = "us-east-1"  # Change if needed

# Validate input
if bucket_name.nil? || bucket_name.strip.empty?
  puts "Usage: ruby create_s3_bucket.rb <bucket-name>"
  exit 1
end

# Construct the AWS CLI command
command = [
  "aws", "s3api", "create-bucket",
  "--bucket", bucket_name,
  "--region", region,
  "--create-bucket-configuration", "LocationConstraint=#{region}"
]

# Run the command and capture output
stdout, stderr, status = Open3.capture3(*command)

if status.success?
  puts "Bucket '#{bucket_name}' created successfully in region '#{region}'."
else
  puts "Failed to create bucket. Error:"
  puts stderr
end
