resource "aws_ssm_parameter" "access_key" {
  name  = "my-access-key"
  type  = "SecureString"
  value = "AKIA2BQZ3VEFWGAAOY7G"
}

resource "aws_ssm_parameter" "secret_key" {
  name  = "my-secret-key"
  type  = "SecureString"
  value = "ilbh0G4Me4bfFYxcdZwETZi5vOeT8isbJwYbzo5L"
}
