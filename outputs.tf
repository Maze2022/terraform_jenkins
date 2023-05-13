#....root/output.tf 

output "public_ip" {
  value = module.jenkins-server.public_ip
}