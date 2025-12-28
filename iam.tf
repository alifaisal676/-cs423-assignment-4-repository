#resource "aws_iam_user" "terraform_user" {
 # name = "terraform-cs423-devops"
#}

#resource "aws_iam_user_login_profile" "login" {
 # user = aws_iam_user.terraform_user.name
  #password_reset_required = false
#}

#resource "aws_iam_user_policy_attachment" "admin_policy" {
#  user       = aws_iam_user.terraform_user.name
 # policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
#}

#resource "aws_iam_access_key" "access_key" {
 # user = aws_iam_user.terraform_user.name
#}
