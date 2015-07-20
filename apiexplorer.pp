class projects::apiexplorer {
  boxen::project { 'apiexplorer':
    nodejs => 'v0.12.5',
    nginx  => true,
    source => 'git@bitbucket.org:torodev/toro-explorer.git'
  }
}
