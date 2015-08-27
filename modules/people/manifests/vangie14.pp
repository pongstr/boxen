class people::vangie14 {

  require groups::ganesha
  notify { 'Hello ${::boxen_user}': }

  package { 'skype':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ]
  }
  
}
