terraform {
  backend "s3" {
    bucket = "acirrustech-env-prod"
    key    = "infrustructure/prod"
    region = "eu-west-1"
  }
}