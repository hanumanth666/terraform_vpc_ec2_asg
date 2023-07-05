
resource "aws_instance" "example_instance" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.example_subnet.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  key_name      = "your_key_pair_name"     # Replace with your SSH key pair name

  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World!" > /home/ubuntu/hello.txt
  EOF

  # Attach the EBS volume to the EC2 instance
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_id   = aws_ebs_volume.example_ebs_volume.id
  }
}