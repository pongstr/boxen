class projects::coder {
  boxen::project { 'coder' :
    mongodb  => true,
    nginx    => "/opt/boxen/repo/modules/projects/templates/shared/coder.conf.erb",
    nodejs   => 'v0.12.5',
    source   => 'git@bitbucket.org:torodev/coder.io.git'
  }
}
