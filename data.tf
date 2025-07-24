data "aws_ami" "joindevops" {
  owners           = ["973714476881"]
  most_recent      = true

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ssm_parameter" "access_key" {
  name            = "my-access-key"
  with_decryption = true
}

data "aws_ssm_parameter" "secret_key" {
  name            = "my-secret-key"
  with_decryption = true
}
