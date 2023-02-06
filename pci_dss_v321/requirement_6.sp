benchmark "pci_dss_v321_requirement_6" {
  title       = "Requirement 6: Develop and maintain secure systems and applications"
  description = "Security vulnerabilities in systems and applications may allow criminals to access PAN and other cardholder data. Many of these vulnerabilities are eliminated by installing vendor-provided security patches, which perform a quick-repair job for a specific piece of programming code. All critical systems must have the most recently released software patches to prevent exploitation. Entities should apply patches to less-critical systems as soon as possible, based on a risk-based vulnerability management program. Secure coding practices for developing applications, change control procedures and other secure software development practices should always be followed."
  children = [
    benchmark.pci_dss_v321_requirement_6_2,
    benchmark.pci_dss_v321_requirement_6_5,
    benchmark.pci_dss_v321_requirement_6_6
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_6_2" {
  title = "Protect all system components and software from known vulnerabilities by installing applicable vendor-supplied security patches. Install critical security patches within one month of release"
  children = [
    control.compute_vm_vulnerability_assessment_solution_enabled,
    // control 2
    control.sql_database_vulnerability_findings_resolved,
    control.compute_vm_system_updates_installed,
    // control 5
  ]

  tags = merge(local.pci_dss_v321_common_tags, {
    service = "Azure/Monitor"
  })
}

benchmark "pci_dss_v321_requirement_6_5" {
  title = "Prevent common coding vulnerabilities in software development processes by training developers in secure coding techniques and developing applications based on secure coding guidelines - including how sensitive data is handled in memory"
  children = [
    benchmark.pci_dss_v321_requirement_6_5_3
  ]

  tags = merge(local.pci_dss_v321_common_tags, {
    service = "Azure/Monitor"
  })
}

benchmark "pci_dss_v321_requirement_6_5_3" {
  title = "Insecure cryptographic storage"
  children = [
    control.appservice_web_app_use_https,
    // control 2
    control.appservice_function_app_only_https_accessible,
    control.azure_redis_cache_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled,
    control.servicefabric_cluster_protection_level_as_encrypt_and_sign,
    control.sql_database_transparent_data_encryption_enabled,
    // control 8
  ]

  tags = merge(local.pci_dss_v321_common_tags, {
    service = "Azure/Monitor"
  })
}

benchmark "pci_dss_v321_requirement_6_6" {
  title = "Ensure all public-facing web applications are protected against known attacks, either by performing application vulnerability assessment at least annually and after any changes, or by installing an automated technical solution that detects and prevents web-based attacks (for example, a web-application firewall) in front of public-facing web applications, to continually check all traffic"
  children = [
    control.compute_vm_vulnerability_assessment_solution_enabled,
    // control 2
    control.sql_database_vulnerability_findings_resolved,
    control.compute_vm_system_updates_installed,
    // control 5
  ]

  tags = merge(local.pci_dss_v321_common_tags, {
    service = "Azure/Monitor"
  })
}