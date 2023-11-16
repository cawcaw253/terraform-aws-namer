variable "delimiter" {
  type        = string
  default     = "-"
  description = "A delimiter variable that combines each element."
}

variable "prefix" {
  type        = list(string)
  default     = ["project", "environment"]
  description = "A prefix value of the form `{resource_name} {prefix} {identifier} {sufix}`, where the listed values are combined into a `delimiter` variable."
}

variable "identifier" {
  type        = list(string)
  default     = []
  description = "A identifier value of the form `{resource_name} {prefix} {identifier} {sufix}`, where the listed values are combined into a `delimiter` variable."
}

variable "with_additional_identifier_verb" {
  type        = bool
  default     = false
  description = "If this value is false, naming doesn't contain additional identifier suffix."
}

variable "with_random_string" {
  type        = bool
  default     = false
  description = ""
}
