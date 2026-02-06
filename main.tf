resource "aws_instance" "app" {
  ami           = "ami-010be25c3775061c9" # replace
  instance_type = var.instance_type[terraform.workspace]
  count         = var.instance_count[terraform.workspace]

  tags = {
    Name        = "workspace-${terraform.workspace}"
    Environment = terraform.workspace
  }
}