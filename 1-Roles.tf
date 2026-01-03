

# 1) IAM Role (EC2 can assume it)
resource "aws_iam_role" "lab_ec2_role" {
  name = "lab-ec2-secrets-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

# 2) (Simple) Permissions for now: allow reading secrets
# Later you can lock Resource down to only lab/rds/mysql ARN.
resource "aws_iam_role_policy" "lab_ec2_secrets_policy" {
  name = "lab-ec2-secrets-inline"
  role = aws_iam_role.lab_ec2_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "secretsmanager:GetSecretValue",
        "secretsmanager:DescribeSecret"
      ]
      Resource = "*"
    }]
  })
}


# 3) Instance Profile (this is what EC2 attaches)
resource "aws_iam_instance_profile" "lab_ec2_profile" {
  name = "lab-ec2-secrets-profile" 
  role = aws_iam_role.lab_ec2_role.name
}

output "lab_ec2_role_name" {
  value = aws_iam_role.lab_ec2_role.name
}

output "lab_ec2_instance_profile_name" {
  value = aws_iam_instance_profile.lab_ec2_profile.name
}
