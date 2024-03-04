// creat first server
resource "aws_instance" "first" {
  ami           = "ami-03bb6d83c60fc5f7c" 
  instance_type = "t2.micro"
  key_name      = "Linux-VM-Key7"    
  user_data     = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo yum install -y httpd
  sudo systemctl start httpd
  sudo systemctl enable httpd
  chkconfig httpd on
  echo "THIS IS FIRST WEB SERVER" > /var/www/html/index.html
  EOF

  tags = {
    Name   = "First_web_server"
    source = "terraform"
  }
}

// creat second server
resource "aws_instance" "second" {
  ami           = "ami-03bb6d83c60fc5f7c" 
  instance_type = "t2.micro"
  key_name      = "Linux-VM-Key7"    
  user_data     = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo yum install -y httpd
  sudo systemctl start httpd
  sudo systemctl enable httpd
  chkconfig httpd on
  echo "THIS IS SECOND WEB SERVER" > /var/www/html/index.html
  EOF

  tags = {
    Name   = "Second_web_server"
    source = "terraform"
  }
}
