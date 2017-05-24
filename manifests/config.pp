class snmp::config {
  File {
    owner   => 'root',
    group   => 'root',
    require => Class['snmp::install'],
    notify  => Class['snmp::service'],
  }

  file { $snmp::snmp_dir:
    ensure  => directory,
    purge   => $snmp::purge_snmp_dir,
    recurse => true,
    force   => true,
  }
  
  file { $snmp::snmpd_conf:
    ensure  => file,
    content => template("${module_name}/snmpd_conf.erb"),
  }
}