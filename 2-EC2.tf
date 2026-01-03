resource "aws_instance" "lab-ec2-app" {
  ami           = "ami-0ebf411a80b6b22cb"
  instance_type = "t3.micro"
  key_name      = "key2026"



  iam_instance_profile = aws_iam_instance_profile.lab_ec2_profile.name


  tags = {
    Name = "lab-ec2-app"
  }

  user_data = <<-EOF
    #!/bin/bash
    dnf update -y
    dnf install -y httpd
    systemctl enable --now httpd
    echo "EC2 is up" > /var/www/html/index.html
  EOF
}