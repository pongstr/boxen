class projects::explorer {

  $projects = "/Users/${::boxen_user}/Projects"
  $explorer = "${projects}/explorer"

  file { $projects: ensure => directory }
  file { $explorer: ensure => directory }

  boxen::project { 'explorer':
    dir    => "${explorer}"
    nodejs => 'v0.12.5',
    nginx  => true,
    source => 'git@bitbucket.org:torodev/toro-explorer.git'
  }
}
