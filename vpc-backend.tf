terraform {
  backend "s3" {
    bucket = "dummy.remotestate.net"
    key    = "vpcDUMMY.tfstate"
    region = "us-west-2"
  }
}
