output "instance_id" {
    description = "ID of the EC2 instance"
    value       = aws_instance.app_server_ec2.id
}

output "instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value       = aws_instance.app_server_ec2.public_ip
}

output "instance_private_ip" {
    description = "Private IP address of the EC2 instance"
    value       = aws_instance.app_server_ec2.private_ip
}