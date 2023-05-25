output "site_name" {
  description = "The fully qualified domain name of the site."
  value       = incapsula_site.this.domain
}

output "site_id" {
  description = "Unique identifier in the API for the site."
  value       = incapsula_site.this.id
}

output "site" {
  description = "The association between the fully qualified domain name and the uid for the site."
  value       = tomap({ "${incapsula_site.this.domain}" = "${incapsula_site.this.id}" })
}

output "dns_cname_record_value" {
  description = "The CNAME record value."
  value       = incapsula_site.this.dns_cname_record_value
}

output "domain_verification" {
  description = "The domain verification."
  value       = incapsula_site.this.domain_verification
}

output "dns_record_name" {
  description = "The TXT record that needs to be updated."
  value       = incapsula_site.this.dns_record_name
}