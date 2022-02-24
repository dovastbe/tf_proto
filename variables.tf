variable "OrderDate" {
  type        = string
  description = "The order date."
}

variable "OrderNumber" {
  type        = string
  description = "The order number."
}

variable "Environment" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
}

variable "Region" {
  type        = string
  description = "The region for the deployment."
}

variable "AppCode" {
  type        = string
  description = "The associated Application code"
  validation {
    condition     = length(var.AppCode) == 3
    error_message = "The AppCode should be a 3 letters."
  }
}

variable "AppDesc" {
  type        = string
  description = "The associated Application Description"
}

variable "ec2_instances" {
  default     = {}
  type        = map(any)
  description = "Virutal machine variables"
}

variable "rds" {
  default     = {}
  type        = map(any)
  description = "Database variables"
}


variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

variable "AWS_ACCESS_KEY_ID" {
  type      = string
  sensitive = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  type      = string
  sensitive = true
}
