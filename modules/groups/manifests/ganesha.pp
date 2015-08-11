# Ganesha: Installation Setup for Production team

class groups::ganesha {

  notify { 'Hello Ganesha member, Let\'s set you up.': }

  include cyberduck

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

  package { 'java':
    ensure     => installed,
    provider   => 'brewcask',
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

  package { 'filezilla':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ],
  }

}
