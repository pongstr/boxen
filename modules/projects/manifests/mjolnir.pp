class projects::mjolnir {

  boxen::project { 'coder.io':
    mongodb  => true,
    nodejs   => 'v0.12.5',
    source   => 'git@bitbucket.org:torodev/coder.io.git'
  }

  boxen::project { 'uikit':
    nodejs   => 'v0.12.5',
    source   => 'git@bitbucket.org:torodev/darkstar.git'
  }

  boxen::project { 'apiexplorer':
    nodejs   => 'v0.12.5',
    source   => 'git@bitbucket.org:torodev/toro-explorer.git'
  }

}
