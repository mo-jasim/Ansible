output "ec2_public_ip" {
  value = { for key, instance in aws_instance.my_instance : key => instance.public_ip }
}

output "ec2_dns" {
  value = { for key, instance in aws_instance.my_instance : key => instance.public_dns }
}