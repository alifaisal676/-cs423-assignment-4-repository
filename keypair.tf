resource "aws_key_pair" "key" {
  key_name   = "cs423-assignment4-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
