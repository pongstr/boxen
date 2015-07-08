# Shiva: Installation Setup for Junior Backend Developers

class groups::shiva {
  notify { 'Hello Shiva member, Let\'s set you up.': }

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
  package { 'filezilla':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries'],
  }
  package { 'openoffice':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries'],
  }
  package { 'adobe-reader':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries'],
  }
  package { 'yemuzip':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries'],
  }
  package { 'unrarx':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries'],
  }

}
