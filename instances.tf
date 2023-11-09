# 2 Instances of Redhat Servers (t2.micro)
resource "aws_instance" "redhat_servers" {
  count                  = 2
  ami                    = var.redhatami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  subnet_id              = element(aws_subnet.private_subnets.*.id, count.index)
  key_name               = var.key_name
  user_data              = file("init_script.sh")
  tags = {
    Name = "Redhat_Servers"
    Type = "Redhat_Worker"
  }
}

# A server in the private subnet running httpd as a service
resource "aws_instance" "httpd_server" {
  ami                    = var.ubuntuami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  subnet_id              = aws_subnet.private_subnets[0].id  # Assuming you want to place it in the first private subnet
  key_name               = var.key_name
  user_data              = file("init_script.sh")  # You may need to customize this for httpd installation
  tags = {
    Name = "Httpd_Server"
    Type = "Web_Server"
  }
}
