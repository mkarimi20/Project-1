output "bucket_name"  {
value = aws_s3_bucket.cirrustech-env-prod.bucket
}

output "bucket_name2"  {
value = aws_security_group.bastionhost.name
}
output "sec_group"  {
value = aws_s3_bucket.cirrustech-env-prod.bucket
}

output "key_name"  {
value = aws_key_pair.terraform.key_name
}

output "IPs3" {
  value = aws_instance.web.*.public_ip
}