terraform {
    backend "s3" {
        encrypt = true
        bucket = "terraform-remote-state-storage-s3-xyz123"
        dynamodb_table = "dynamodb-terraform-state-lock-xyz123"
        region = "us-west-2"
        key = "jenkins-terraform-makefile-aws.tfstate"
    }
}