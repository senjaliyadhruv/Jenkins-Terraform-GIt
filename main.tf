resource "aws_instance" "jenkins_ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro" # free tier eligible
  #   key_name      = "your-keypair-name" # replace with your keypair

  user_data = file("install-tools.sh")

  tags = {
    Name = "jenkins-practice-ec2"
  }
}

# Fetch latest Ubuntu 22.04 LTS AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}
