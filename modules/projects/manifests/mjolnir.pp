class projects::mjolnir {

  exec { 'Create Projects Directory':
    ensure => directory,
    onlyif => ["test ! -d ${home}/Projects"]
  }

  file { "${home}/Projects":
    ensure  => directory,
    require => Exec['Create Projects Directory'],
  }

  boxen::project { "${home}/Projects/coderio" :
    mongodb  => true,
    nodejs   => 'v0.12.5',
    source   => 'git@bitbucket.org:torodev/coder.io.git'
  }

  boxen::project { "${home}/Projects/uikit":
    nodejs   => 'v0.12.5',
    source   => 'git@bitbucket.org:torodev/darkstar.git'
  }

  boxen::project { "${home}/Projects/apiexplorer":
    nodejs   => 'v0.12.5',
    source   => 'git@bitbucket.org:torodev/toro-explorer.git'
  }

}
