# Configure the AWS provider
provider "aws" {
  profile = "tf-deploy"
  region  = "eu-west-1"
}

# Fetch the latest Amazon Linux 2 AMI
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

# Create an EC2 instance using the fetched AMI
resource "aws_instance" "exampleEc2" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-provisioned"
  }
    # Prevent destroy of the instance
#   lifecycle {
#     prevent_destroy = true
#   }
}

# Generate 5 random pet names for S3 bucket names
resource "random_pet" "bucket_names" {
  count = 5
}

# Create 5 S3 buckets with generated names
resource "aws_s3_bucket" "example_buckets" {
  count  = 5
  bucket = "example-bucket-${random_pet.bucket_names[count.index].id}"
  # Terraform will delete all objects on destroy rather than error
  force_destroy = true
}

# Configure public access block for the created S3 buckets
resource "aws_s3_bucket_public_access_block" "example_buckets_public_access_block" {
  count                   = 5
  bucket                  = aws_s3_bucket.example_buckets[count.index].id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


