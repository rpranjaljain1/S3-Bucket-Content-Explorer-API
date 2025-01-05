output "instance_id" {
  value = aws_instance.test-instance.id
}

resource "local_file" "instance_output" {
  content = aws_instance.test-instance.id
  filename = "${path.module}/instance_id.txt"
}