
terraform {
  cloud {
    organization = "dovastbe"

    workspaces {
      name = "tf_prototype"
    }
  }
}
