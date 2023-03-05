terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.55.0"
    }
  }
}

provider    "aws" {
region = "us-east-1"
access_key = "AKIATS2WI6J7Z5IJ7XHW"
secret_key = "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"
}

