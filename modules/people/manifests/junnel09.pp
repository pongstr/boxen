class people::junnel09 {

  require groups::osiris
  notify { 'Hello ${::boxen_user}': }

  include webstorm::yosemite

  package { 'eclipse-jee':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--appdir=/Applications'
    ],
  }

  package { 'groovy':
    ensure   => 'latest',
    provider => 'homebrew',
    require  => Package['java']
  }

}
