#...jenkins-server/output.tf

output "public_ip" {
  value       = aws_instance.jenkins-server.public_ip
  description = "The public ip address of the instance"
}