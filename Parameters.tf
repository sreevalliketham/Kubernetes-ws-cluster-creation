resource "aws_ssm_parameter" "access_key" {
  name        = "my-access-key"
  type        = "SecureString"
  value       = var.access_key
  overwrite   = true
}

resource "aws_ssm_parameter" "secret_key" {
  name        = "my-secret-key"
  type        = "SecureString"
  value       = var.secret_key
  overwrite   = true
}
