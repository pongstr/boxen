# Osiris: Installation Setup for System Administrators

class groups::osiris {

  notify { 'Hello Osiris Member, we\'re setting up your workstations': }

  include boot2docker
  include iterm2::stable
  include mysql
  include python
  include sourcetree
  include sublime_text
  include tunnelblick
  include virtualbox
  include zsh

  package { 'asciinema':
    ensure   => installed,
    provider => 'homebrew',
  }

  package { 'atom':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ]
  }

  package { 'autodmg':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ]
  }

  package { 'cord':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ]
  }

  package { 'docker-compose':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ]
  }

  package { 'evernote':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ]
  }

  package { 'filezilla':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ]
  }

  package { 'github':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ]
  }

  package { 'java':
    ensure     => installed,
    provider   => 'brewcask',
  }

  package { 'Keynote':
    ensure   => installed,
    provider => 'compressed_app',
    source   => 'http://192.168.21.151/Keynote.zip'
  }

  package { 'mysqlworkbench':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ]
  }

  package { 'openoffice':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ]
  }

  package { 'sequel-pro':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ]
    }

  package { 'sqldeveloper':
    ensure   => installed,
    provider => 'compressed_app',
    source   => 'http://192.168.21.151/sqldeveloper-4.1.1.19.59-macosx.app.zip'
  }

  package { 'teamviewer':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ]
  }

  package { 'vim':
    ensure => present,
  }

  package { 'vmware-fusion':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ]
  }

  package { 'wireshark':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--no-binaries',
      '--appdir=/Applications'
    ]
  }

  # Vagrant Box Setup:
  vagrant::box { 'squeeze64/vmware_fusion':
    source => 'https://s3.amazonaws.com/github-ops/vagrant/squeeze64-6.0.7-vmware_fusion.box'
  }

  # Oh-My-ZSH
  exec { 'install oh-my-zsh plugin':
    command => "curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh",
    onlyif => [
      "test ! -d ${home}/.oh-my-zsh"
    ]
  }
}
