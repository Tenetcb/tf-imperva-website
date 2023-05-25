terraform {
  required_version = ">= 1.3.0"

  required_providers {
    incapsula = {
      source  = "imperva/incapsula"
      version = "3.17.0"
    }
  }
}
