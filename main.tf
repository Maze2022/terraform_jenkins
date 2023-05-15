#--root/main.tf

module "jenkins-server" {
  source        = "./jenkins-server"
  instance_type = "t2.micro"
  user_data     = filebase64("./install_jenkins.sh")
  tag           = "Jenkins-server"
  # key_name      = "mykeys"
  # public_key_path = "/c/Users/imaze/.ssh/id_rsa"
}