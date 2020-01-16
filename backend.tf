terraform {
  backend "s3" {
    bucket = "acirrustech-env-prod"
    key    = "aws/ec2/ec2_state"
    region = "eu-west-1"
  }
}