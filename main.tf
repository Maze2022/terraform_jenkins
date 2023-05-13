#--root/main.tf

module "jenkins-server" {
  source        = "./jenkins-server"
  instance_type = "t2.micro"
  user_data     = filebase64("./install_jenkins.sh")
  key_name      = "jenkins-keys"
  # public_key_path = "/c/Users/imaze/.ssh/jenkins-keyseys.pub"
}