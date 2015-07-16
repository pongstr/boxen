# Shiva: Installation Setup for Junior Backend Developers

class groups::shiva {
  
  notify { 'Hello Shiva member, Let\'s set you up.': }

  include cyberduck

  package { 'eclipse-jee':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--appdir=/Applications'
    ],
  }

  package { 'Keynote':
    ensure   => installed,
    provider => 'compressed_app',
    source   => 'http://192.168.21.151/Keynote.zip'
  }

  package { 'winzip':
    ensure   => installed,
    provider => 'appdmg',
    source   => 'http://192.168.21.151/winzipmacedition40.dmg'
  }

  package { 'openoffice':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--appdir=/Applications'
    ],
  }

  package { 'adobe-reader':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--appdir=/Applications'
    ],
  }

  package { 'yemuzip':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ],
  }

  package { 'unrarx':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ],
  }

  package { 'adobe-creative-cloud':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--appdir=/Applications'
    ]
  }

}
