class projects::coder {

  $projects = "/Users/${::boxen_user}/BoxenProjects"
  $coder    = "${projects}/coder"

  file { $projects: ensure => directory }
  file { $coder:    ensure => directory }

  file { 'self_signed_certs':
    ensure => file,
    source => 'puppet:///modules/projects/templates/shell/certs.sh',
    path   => "${projects}/certs.sh",
    owner  => 'root',
    notify => Exec['CreateSelfSignedCerts'],
  }

  exec { 'CreateSelfSignedCerts':
    command     => '${projects}/certs.sh',
    refreshonly => true
  }

  boxen::project { 'coder':
    dir      => "${coder}",
    mongodb  => true,
    nginx    => "/opt/boxen/repo/modules/projects/templates/shared/coder.conf.erb",
    nodejs   => 'v0.12.5',
    source   => 'git@bitbucket.org:torodev/coder.io.git'
  }
}
