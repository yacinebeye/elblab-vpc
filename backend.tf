terraform {
  backend "s3" {
    bucket = "elblab2-118369402652-tfstates"
    key    = "minilabs/elbminilab-vpc/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}