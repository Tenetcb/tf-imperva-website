# website

Terraform module permit to manage website on Imperva

## Usage

```shell
  domain                 = "examplesite.com"
  account_id             = 123
  send_site_setup_emails = "false"
  site_ip                = "2.2.2.2"
  force_ssl              = "false"
  logs_account_id        = "456"
  data_storage_region    = "US"
  hashing_enabled        = true
  hash_salt              = "foobar"
  log_level              = "full"
  
  # Performance
  perf_client_comply_no_cache              = true
  perf_client_enable_client_side_caching   = true
  perf_client_send_age_header              = true
  perf_key_comply_vary                     = true
  perf_key_unite_naked_full_cache          = true
  perf_mode_https                          = "include_all_resources"
  perf_mode_level                          = "standard"
  perf_mode_time                           = 1000
  perf_response_cache_300x                 = true
  perf_response_cache_404_enabled          = true
  perf_response_cache_404_time             = 60
  perf_response_cache_empty_responses      = true
  perf_response_cache_http_10_responses    = true
  perf_response_cache_response_header_mode = "custom"
  perf_response_cache_response_headers     = ["Access-Control-Allow-Origin", "Foo-Bar-Header"]
  perf_response_cache_shield               = true
  perf_response_stale_content_mode         = "custom"
  perf_response_stale_content_time         = 1000
  perf_response_tag_response_header        = "Example-Tag-Value-Header"
  perf_ttl_prefer_last_modified            = true
  perf_ttl_use_shortest_caching            = true
  
  # Datacenter configuration
  site_topology = "SINGLE_DC"

  data_center = {
    dc1 = {
      name       = "FIRST DC"
      ip_mode    = "SINGLE_IP"
      origin_pop = "cdg"

      origin_server = {
        origin_ip = {
          address    = "54.74.193.120"
          is_active  = true
          is_enabled = true
        }
      }
    }
  }
```

<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_incapsula"></a> [incapsula](#provider_incapsula) | 3.17.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_center"></a> [data_center](#input_data_center) | n/a | <pre>map(object({<br>    dc_lb_algorithm        = optional(string)<br>    ip_mode                = optional(string)<br>    is_active              = optional(bool)<br>    is_content             = optional(bool)<br>    is_enabled             = optional(bool)<br>    is_rest_of_the_world   = optional(bool)<br>    name                   = string<br>    origin_pop             = optional(string)<br>    web_servers_per_server = optional(number)<br>    weight                 = optional(number)<br><br>    origin_server = map(object({<br>      address    = string<br>      is_active  = optional(bool)<br>      is_enabled = optional(bool)<br>      weight     = optional(number)<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_domain"></a> [domain](#input_domain) | The fully qualified domain name of the site. | `string` | n/a | yes |
| <a name="input_account_id"></a> [account_id](#input_account_id) | The account to operate on. If not specified, operation will be performed on the account identified by the authentication parameters. | `number` | `null` | no |
| <a name="input_active"></a> [active](#input_active) | Defined if the site is active or bypassed by the Imperva network. | `string` | `null` | no |
| <a name="input_data_storage_region"></a> [data_storage_region](#input_data_storage_region) | The data region to use | `string` | `null` | no |
| <a name="input_force_ssl"></a> [force_ssl](#input_force_ssl) | Force the SSL on the site | `bool` | `null` | no |
| <a name="input_hash_salt"></a> [hash_salt](#input_hash_salt) | Specify the hash salt (masking setting), required if hashing is enabled | `string` | `null` | no |
| <a name="input_hashing_enabled"></a> [hashing_enabled](#input_hashing_enabled) | Specify if hashing (masking setting) should be enabled | `bool` | `null` | no |
| <a name="input_log_level"></a> [log_level](#input_log_level) | The log level | `string` | `null` | no |
| <a name="input_logs_account_id"></a> [logs_account_id](#input_logs_account_id) | Account where logs should be stored. | `string` | `null` | no |
| <a name="input_naked_domain_san"></a> [naked_domain_san](#input_naked_domain_san) | n/a | `bool` | `true` | no |
| <a name="input_perf_client_comply_no_cache"></a> [perf_client_comply_no_cache](#input_perf_client_comply_no_cache) | Comply with No-Cache and Max-Age directives in client requests. | `bool` | `null` | no |
| <a name="input_perf_client_enable_client_side_caching"></a> [perf_client_enable_client_side_caching](#input_perf_client_enable_client_side_caching) | Cache content on client browsers or applications | `bool` | `null` | no |
| <a name="input_perf_client_send_age_header"></a> [perf_client_send_age_header](#input_perf_client_send_age_header) | Send Cache-Control: max-age and Age headers. | `bool` | `null` | no |
| <a name="input_perf_key_comply_vary"></a> [perf_key_comply_vary](#input_perf_key_comply_vary) | Cache resources in accordance with the Vary response header. | `bool` | `null` | no |
| <a name="input_perf_key_unite_naked_full_cache"></a> [perf_key_unite_naked_full_cache](#input_perf_key_unite_naked_full_cache) | Use the Same Cache for Full and Naked Domains. | `bool` | `null` | no |
| <a name="input_perf_mode_https"></a> [perf_mode_https](#input_perf_mode_https) | The resources that are cached over HTTPS. | `string` | `null` | no |
| <a name="input_perf_mode_level"></a> [perf_mode_level](#input_perf_mode_level) | Caching level | `string` | `null` | no |
| <a name="input_perf_mode_time"></a> [perf_mode_time](#input_perf_mode_time) | The time, in seconds, that you set for this option determines how often the cache is refreshed. | `number` | `null` | no |
| <a name="input_perf_response_cache_300x"></a> [perf_response_cache_300x](#input_perf_response_cache_300x) | When this option is checked Imperva will cache 301, 302, 303, 307, and 308 redirect response headers containing the target URI. | `bool` | `null` | no |
| <a name="input_perf_response_cache_404_enabled"></a> [perf_response_cache_404_enabled](#input_perf_response_cache_404_enabled) | Whether or not to cache 404 responses. | `bool` | `null` | no |
| <a name="input_perf_response_cache_404_time"></a> [perf_response_cache_404_time](#input_perf_response_cache_404_time) | The time in seconds to cache 404 responses. | `number` | `null` | no |
| <a name="input_perf_response_cache_empty_responses"></a> [perf_response_cache_empty_responses](#input_perf_response_cache_empty_responses) | Cache responses that don’t have a message body. | `bool` | `null` | no |
| <a name="input_perf_response_cache_http_10_responses"></a> [perf_response_cache_http_10_responses](#input_perf_response_cache_http_10_responses) | Cache HTTP 1.0 type responses that don’t include the Content-Length header or chunking. | `bool` | `null` | no |
| <a name="input_perf_response_cache_response_header_mode"></a> [perf_response_cache_response_header_mode](#input_perf_response_cache_response_header_mode) | The working mode for caching response headers. | `string` | `null` | no |
| <a name="input_perf_response_cache_response_headers"></a> [perf_response_cache_response_headers](#input_perf_response_cache_response_headers) | An array of strings representing the response headers to be cached when working in custom mode. | `list(string)` | `null` | no |
| <a name="input_perf_response_cache_shield"></a> [perf_response_cache_shield](#input_perf_response_cache_shield) | Adds an intermediate cache between other Imperva PoPs and your origin servers to protect your servers from redundant requests. | `bool` | `null` | no |
| <a name="input_perf_response_stale_content_mode"></a> [perf_response_stale_content_mode](#input_perf_response_stale_content_mode) | The working mode for serving stale content. | `string` | `null` | no |
| <a name="input_perf_response_stale_content_time"></a> [perf_response_stale_content_time](#input_perf_response_stale_content_time) | The time, in seconds, to serve stale content for when working in custom work mode. | `number` | `null` | no |
| <a name="input_perf_response_tag_response_header"></a> [perf_response_tag_response_header](#input_perf_response_tag_response_header) | Tag the response according to the value of this header. | `string` | `null` | no |
| <a name="input_perf_ttl_prefer_last_modified"></a> [perf_ttl_prefer_last_modified](#input_perf_ttl_prefer_last_modified) | Prefer 'Last Modified' over eTag. | `bool` | `null` | no |
| <a name="input_perf_ttl_use_shortest_caching"></a> [perf_ttl_use_shortest_caching](#input_perf_ttl_use_shortest_caching) | Use shortest caching duration in case of conflicts. | `bool` | `null` | no |
| <a name="input_send_site_setup_emails"></a> [send_site_setup_emails](#input_send_site_setup_emails) | Defined if end users will notify by email about the add site process such as DNS instructions and SSL setup. | `bool` | `null` | no |
| <a name="input_site_ip"></a> [site_ip](#input_site_ip) | The web server IP/CNAME. | `string` | `null` | no |
| <a name="input_site_topology"></a> [site_topology](#input_site_topology) | The type of the loadbalancing topology | `string` | `null` | no |
| <a name="input_wildcard_san"></a> [wildcard_san](#input_wildcard_san) | n/a | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_cname_record_value"></a> [dns_cname_record_value](#output_dns_cname_record_value) | The CNAME record value |
| <a name="output_dns_record_name"></a> [dns_record_name](#output_dns_record_name) | The TXT record that needs to be updated |
| <a name="output_domain_verification"></a> [domain_verification](#output_domain_verification) | The domain verification |
| <a name="output_site"></a> [site](#output_site) | n/a |
| <a name="output_site_id"></a> [site_id](#output_site_id) | Unique identifier in the API for the site |
| <a name="output_site_name"></a> [site_name](#output_site_name) | The name of the site |

<!-- END_TF_DOCS -->