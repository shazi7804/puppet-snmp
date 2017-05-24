class snmp::client (

) {
  include ::snmp

  file { $snmp::snmp_conf:
    ensure  => file,
    content => template("${module_name}/snmp_conf.erb"),
  }
}