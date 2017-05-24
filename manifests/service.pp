class snmp::service {
  service { $snmp::service_name:
    ensure     => $snmp::service_ensure,
    enable     => $snmp::service_enable,
    hasstatus  => $snmp::service_hasstatus,
    hasrestart => $snmp::service_hasrestart,
    require    => Class['snmp::config'],
  }
}