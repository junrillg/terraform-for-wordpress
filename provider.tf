provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.aws-linux.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet_1.id
  vpc_security_group_ids = [aws_security_group.web.id]
  key_name               = var.aws_key_name

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_private_key_path)
  }

  provisioner "file" {
    source      = "provision.sh"
    destination = "/tmp/provision.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/provision.sh",
      "/tmp/provision.sh",
    ]
  }
}
