output out_public_ip_addresses {
  value = aws_instance.terraform-staging.*.public_ip
}

output out_private_ip_addresses {
  value = aws_instance.terraform-staging.*.private_ip
}

