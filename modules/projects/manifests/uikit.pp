class projects::uikit {

  $projects = "/Users/${::boxen_user}/Projects"
  $uikit    = "${projects}/uikit"

  file { $projects: ensure => directory }
  file { $uikit:    ensure => directory }

  boxen::project { 'uikit':
    dir    => "${uikit}",
    nodejs => 'v0.12.5',
    nginx  => "/opt/boxen/repo/modules/projects/templates/shared/uikit.conf.erb",
    source => 'git@bitbucket.org:torodev/darkstar.git'
  }
}
