## list

- `aws s3 ls ` - list all buckets in your account

## Delete the listed buckets

- `aws s3 | awk '{print $3}' | xargs =I {} aws s3 rb s3://{}` - delete all buckets listed in the previous command
