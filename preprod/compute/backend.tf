terraform {
  backend "s3" {
    bucket = "tfstate-own-challenge"
    region = "ap-south-1"
    key = "preprod/compute/tfstate"
      }
}