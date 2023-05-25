resource "incapsula_site" "this" {
  domain                 = var.domain
  account_id             = var.account_id
  send_site_setup_emails = var.send_site_setup_emails
  site_ip                = var.site_ip
  force_ssl              = var.force_ssl
  logs_account_id        = var.logs_account_id
  active                 = var.active
  data_storage_region    = var.data_storage_region
  hashing_enabled        = var.hashing_enabled
  hash_salt              = var.hash_salt
  log_level              = var.log_level
  naked_domain_san       = var.naked_domain_san
  wildcard_san           = var.wildcard_san

  # Performance / Cache
  perf_client_comply_no_cache              = var.perf_client_comply_no_cache
  perf_client_enable_client_side_caching   = var.perf_client_enable_client_side_caching
  perf_client_send_age_header              = var.perf_client_send_age_header
  perf_key_comply_vary                     = var.perf_key_comply_vary
  perf_key_unite_naked_full_cache          = var.perf_key_unite_naked_full_cache
  perf_mode_https                          = var.perf_mode_https
  perf_mode_level                          = var.perf_mode_level
  perf_mode_time                           = var.perf_mode_time
  perf_response_cache_300x                 = var.perf_response_cache_300x
  perf_response_cache_404_enabled          = var.perf_response_cache_404_enabled
  perf_response_cache_404_time             = var.perf_response_cache_404_time
  perf_response_cache_empty_responses      = var.perf_response_cache_empty_responses
  perf_response_cache_http_10_responses    = var.perf_response_cache_http_10_responses
  perf_response_cache_response_header_mode = var.perf_response_cache_response_header_mode
  perf_response_cache_response_headers     = var.perf_response_cache_response_headers
  perf_response_cache_shield               = var.perf_response_cache_shield
  perf_response_stale_content_mode         = var.perf_response_stale_content_mode
  perf_response_stale_content_time         = var.perf_response_stale_content_time
  perf_response_tag_response_header        = var.perf_response_tag_response_header
  perf_ttl_prefer_last_modified            = var.perf_ttl_prefer_last_modified
  perf_ttl_use_shortest_caching            = var.perf_ttl_use_shortest_caching
}

resource "incapsula_data_centers_configuration" "this" {
  site_id       = incapsula_site.this.id
  site_topology = var.site_topology

  dynamic "data_center" {
    for_each = var.data_center

    content {
      dc_lb_algorithm        = data_center.value.dc_lb_algorithm
      ip_mode                = data_center.value.ip_mode
      is_active              = data_center.value.is_active
      is_content             = data_center.value.is_content
      is_enabled             = data_center.value.is_enabled
      is_rest_of_the_world   = data_center.value.is_rest_of_the_world
      name                   = data_center.value.name
      origin_pop             = data_center.value.origin_pop
      web_servers_per_server = data_center.value.web_servers_per_server
      weight                 = data_center.value.weight

      dynamic "origin_server" {
        for_each = data_center.value.origin_server

        content {
          address    = origin_server.value.address
          is_active  = origin_server.value.is_active
          is_enabled = origin_server.value.is_enabled
          weight     = origin_server.value.weight
        }
      }
    }
  }
}
