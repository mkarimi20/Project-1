  
output "bucket_name" {
    value = aws_s3_bucket.b.bucket
}

output "sec_group" {
    value = aws_security_group.allow_ssh.name
}

output "key_name" {
    value = aws_key_pair.mkarimi.key_name
}

output "mkarimi_username" {
    value = "some_username"
}

output "wordpress_password" {
    value = "password"
}

output "IPs" {
    value = aws_instance.web.*.public_ip
}