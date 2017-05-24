class snmp::install {
  if $snmp::package_name {
    package { $snmp::package_name:
      ensure => $snmp::package_ensure,
      notify => Class['snmp::service'],
    }
  }
}