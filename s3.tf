resource "aws_s3_bucket" "my_bucket" {   # Create a  AWS S3 bucket resource.
  bucket = "rashi-devops-project-s3"  # must be globally unique

  tags = {
    Name        = "MyBucket"
   
  }
}

resource "aws_s3_bucket_versioning" "my_bucket" {   # create versioning for s3 bucket 
  bucket = aws_s3_bucket.my_bucket.id               # s3 bucket id

  versioning_configuration {
    status = "Enabled"
  }
}