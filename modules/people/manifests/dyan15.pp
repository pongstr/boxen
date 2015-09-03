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

  $ISKYSOFT = 'http://192.168.21.151/mac-pdf-editor_full1273.dmg'

  package { 'iSKYSOFT':
    ensure   => installed,
    provider => 'appdmg',
    source   => $ISKYSOFT
  }

}
