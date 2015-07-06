# Vishnu: Installation Setup for Senior Backend Developers

class groups::vishnu {
  notify { 'Hello Vishnu member, Let\'s set you up.': }

  include firefox
  include chrome
  include dashlane
  include hipchat
  include sublime_text
  include java

  # include eclipse::jee # installable, but fails at `chown`
  package { 'eclipse-ide':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }
  include netbeans
  #package { 'netbeans':
  #  provider => 'brewcask',
  #  install_options => [
  #    '--force',
  #    '--no-binaries',
  #  ]
  #}
#sts
  package { 'sts':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }

  package { 'dbvisualizer':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }
  package { 'groovy':
    provider => 'homebrew',
    ensure => 'latest'
  }
}
