

data "aws_ami" "al2023" {
  most_recent = true
  owners      = var.ami_owners

  filter {
    name   = "name"
    values = [var.ami_name_pattern]
  }
}

resource "aws_instance" "lab_ec2_app" {
  ami                  = data.aws_ami.al2023.id
  instance_type         = var.instance_type
  key_name              = var.key_name
  iam_instance_profile  = aws_iam_instance_profile.lab_ec2_profile.name

  tags = merge(
    { Name = var.instance_name },
    var.extra_tags
  )

  user_data = <<-EOF
    #!/bin/bash
    set -euxo pipefail

    dnf update -y
    dnf install -y httpd
    systemctl enable --now httpd

    echo "${var.index_message} $(hostname)" > /var/www/html/index.html
  EOF
}
