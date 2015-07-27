class people::mikhaila20 {

  #Graphic Designer setup
  require groups::ganesha
  notify { 'Hello ${::boxen_user}': }

  package { 'adobe-creative-cloud':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--appdir=/Applications'
    ]
  }

}
