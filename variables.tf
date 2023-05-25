# Site varibales
variable "domain" {
  type        = string
  description = "The fully qualified domain name of the site."
}

variable "account_id" {
  type        = number
  description = "The account to operate on. If not specified, operation will be performed on the account identified by the authentication parameters."
  default     = null
}

variable "send_site_setup_emails" {
  type        = bool
  description = "Defined if end users will notify by email about the add site process such as DNS instructions and SSL setup."
  default     = null
}

variable "site_ip" {
  type        = string
  description = "The web server IP/CNAME."
  default     = null
}

variable "force_ssl" {
  type        = bool
  description = "Force the SSL on the site."
  default     = null
}

variable "logs_account_id" {
  type        = string
  description = "Account where logs should be stored."
  default     = null
}

variable "active" {
  type        = string
  description = "Defined if the site is active or bypassed by the Imperva network."
  default     = null
}

variable "data_storage_region" {
  type        = string
  description = "The data region to use."
  default     = null
}

variable "hashing_enabled" {
  type        = bool
  description = "Specify if hashing (masking setting) should be enabled."
  default     = null
}

variable "hash_salt" {
  type        = string
  description = "Specify the hash salt (masking setting), required if hashing is enabled."
  default     = null
}

variable "log_level" {
  type        = string
  description = "The log level."
  default     = null
}

variable "naked_domain_san" {
  type        = bool
  description = "Use true to add the naked domain SAN to a www site’s SSL certificate."
  default     = true
}

variable "wildcard_san" {
  type        = bool
  description = "Use true to add the wildcard SAN or false to add the full domain SAN to the site’s SSL certificate."
  default     = true
}

# Performance / Cache variables
variable "perf_client_comply_no_cache" {
  type        = bool
  description = "Comply with No-Cache and Max-Age directives in client requests."
  default     = null
}

variable "perf_client_enable_client_side_caching" {
  type        = bool
  description = "Cache content on client browsers or applications."
  default     = null
}

variable "perf_client_send_age_header" {
  type        = bool
  description = "Send Cache-Control: max-age and Age headers."
  default     = null
}

variable "perf_key_comply_vary" {
  type        = bool
  description = "Cache resources in accordance with the Vary response header."
  default     = null
}

variable "perf_key_unite_naked_full_cache" {
  type        = bool
  description = "Use the Same Cache for Full and Naked Domains."
  default     = null
}

variable "perf_mode_https" {
  type        = string
  description = "The resources that are cached over HTTPS."
  default     = null
}

variable "perf_mode_level" {
  type        = string
  description = "Caching level."
  default     = null
}

variable "perf_mode_time" {
  type        = number
  description = "The time, in seconds, that you set for this option determines how often the cache is refreshed."
  default     = null
}

variable "perf_response_cache_300x" {
  type        = bool
  description = "When this option is checked Imperva will cache 301, 302, 303, 307, and 308 redirect response headers containing the target URI."
  default     = null
}

variable "perf_response_cache_404_enabled" {
  type        = bool
  description = "Whether or not to cache 404 responses."
  default     = null
}

variable "perf_response_cache_404_time" {
  type        = number
  description = "The time in seconds to cache 404 responses."
  default     = null
}

variable "perf_response_cache_empty_responses" {
  type        = bool
  description = "Cache responses that don’t have a message body."
  default     = null
}

variable "perf_response_cache_http_10_responses" {
  type        = bool
  description = "Cache HTTP 1.0 type responses that don’t include the Content-Length header or chunking."
  default     = null
}

variable "perf_response_cache_response_header_mode" {
  type        = string
  description = "The working mode for caching response headers."
  default     = null
}

variable "perf_response_cache_response_headers" {
  type        = list(string)
  description = "An array of strings representing the response headers to be cached when working in custom mode."
  default     = null
}

variable "perf_response_cache_shield" {
  type        = bool
  description = "Adds an intermediate cache between other Imperva PoPs and your origin servers to protect your servers from redundant requests."
  default     = null
}

variable "perf_response_stale_content_mode" {
  type        = string
  description = "The working mode for serving stale content."
  default     = null
}

variable "perf_response_stale_content_time" {
  type        = number
  description = "The time, in seconds, to serve stale content for when working in custom work mode."
  default     = null
}

variable "perf_response_tag_response_header" {
  type        = string
  description = "Tag the response according to the value of this header."
  default     = null
}

variable "perf_ttl_prefer_last_modified" {
  type        = bool
  description = "Prefer 'Last Modified' over eTag."
  default     = null
}

variable "perf_ttl_use_shortest_caching" {
  type        = bool
  description = "Use shortest caching duration in case of conflicts."
  default     = null
}

# Datacenter variables
variable "site_topology" {
  type        = string
  description = "The type of the loadbalancing topology."
  default     = null
}

variable "data_center" {
  description = "Permit to declare and manage one or more Origin Servers."
  type = map(object({
    dc_lb_algorithm        = optional(string)
    ip_mode                = optional(string)
    is_active              = optional(bool)
    is_content             = optional(bool)
    is_enabled             = optional(bool)
    is_rest_of_the_world   = optional(bool)
    name                   = string
    origin_pop             = optional(string)
    web_servers_per_server = optional(number)
    weight                 = optional(number)

    origin_server = map(object({
      address    = string
      is_active  = optional(bool)
      is_enabled = optional(bool)
      weight     = optional(number)
    }))
  }))

}