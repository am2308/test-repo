# create-s3-bucket.ps1

param (
    [string]$BucketName
)

$Region = "us-east-1"

if (-not $BucketName) {
    Write-Host "Usage: .\create-s3-bucket.ps1 -BucketName <bucket-name>"
    exit 1
}

# Create the S3 bucket
$Result = aws s3api create-bucket `
    --bucket $BucketName `
    --region $Region `
    --create-bucket-configuration LocationConstraint=$Region 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "Bucket '$BucketName' created successfully in region '$Region'."
} else {
    Write-Host "Failed to create bucket:"
    Write-Host $Result
}
