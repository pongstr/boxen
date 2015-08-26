class people::vangie14 {

  require groups::ganesha
  notify { 'Hello ${::boxen_user}': }


  package { 'remote-desktop-manager':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ]
  }

  package { 'skype':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ]
  }

}
