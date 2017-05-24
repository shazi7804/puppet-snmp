# Class: snmp
# ===========================
#
# Full description of class snmp here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'snmp':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class snmp (
  String $package_name,
  String $package_ensure,
  String $service_name,
  String $service_ensure,
  Boolean $service_enable,
  Boolean $service_hasstatus,
  Boolean $service_hasrestart,
  String $snmp_dir,
  Boolean $purge_snmp_dir,
  String $snmpd_conf,
  String $agent_address,
  String $ro_password,
  String $ro_network,
  String $ro6_password,
  String $ro6_network,
  Array $views,
  Array $com2sec,
  Array $com2sec6,
  Array $groups,
  Array $accesses,
  String $syslocation,
  String $syscontact,
  String $sysservices,
){
  contain snmp::install
  contain snmp::config
  contain snmp::service

  Class['::snmp::install']
  -> Class['::snmp::config']
  ~> Class['::snmp::service']
}