terraform {
  backend "s3" {
    bucket = "acirrustech-env-prod"
    key    = "infrustructure"
    region = "eu-west-1"
  }
}