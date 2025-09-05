/*----------------------------------------------------------------------*/
/* Pritunl | Variable Definition                                        */
/*----------------------------------------------------------------------*/
variable "pritunl_parameters" {
  type        = any
  description = "pritunl parameteres"
  default     = {}
}

variable "pritunl_defaults" {
  type        = any
  description = "pritunl default parameteres"
  default     = {}
}