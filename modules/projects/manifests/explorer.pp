class projects::explorer {
  boxen::project { 'explorer':
    nodejs => 'v0.12.5',
    nginx  => true,
    source => 'git@bitbucket.org:torodev/toro-explorer.git'
  }
}
