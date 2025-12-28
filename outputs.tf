output "web_public_ip" {
  value = aws_instance.web.public_ip
}

output "web_private_ip" {
  value = aws_instance.web.private_ip
}

output "backend_private_ip" {
  value = aws_instance.backend.private_ip
}

#output "iam_user_name" {
 # value = aws_iam_user.terraform_user.name
#}

#output "iam_access_key" {
 # value = aws_iam_access_key.access_key.id
#}

#output "iam_secret_key" {
 # value     = aws_iam_access_key.access_key.secret
  #sensitive = true
#}
