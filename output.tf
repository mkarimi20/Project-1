output "bucket_name"  {
value = aws_s3_bucket.b.bucket
}

output "bucket_name2"  {
value = aws_security_group.allow_ssh.name
}

output "key_name"  {
value = aws_key_pair.deployer.key_name
}

output "IPs3" {
  value = aws_instance.web.*.public_ip
}