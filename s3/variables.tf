variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "versioning" {
  description = "Enable versioning"
  type        = bool
  default     = true
}

variable "logging_bucket" {
  description = "The bucket to store logs"
  type        = string
  default     = ""
}

variable "logging_prefix" {
  description = "The prefix for log objects"
  type        = string
  default     = "logs/"
}

variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
  default     = {}
}