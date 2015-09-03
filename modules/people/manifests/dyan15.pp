class people::dyan15 {

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

  $SCRIBUS = 'http://192.168.21.151/scribus-1.4.5-r2.dmg'

  package { 'SCRIBUS':
    ensure   => installed,
    provider => 'appdmg',
    source   => $SCRIBUS
  }

}
