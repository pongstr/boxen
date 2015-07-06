# Vishnu: Installation Setup for Senior Backend Developers

class groups::vishnu {
  notify { 'Hello Vishnu member, Let\'s set you up.': }

  include firefox
  include chrome
  include dashlane
  include hipchat
  include sublime_text
  include java
  include virtualbox
  include boot2docker
  include mysql
  include github_for_mac
  include vlc
  include wget
  include zsh


  package { 'atom':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }

  # Oh-My-ZSH
  exec { 'install oh-my-zsh plugin':
    command => "curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh",
    onlyif => [
      "test ! -d ${home}/.oh-my-zsh"
    ]
  }

  package { 'mysqlworkbench':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }
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
  package { 'diffmerge':
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
  package { 'textwrangler':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }
  package { 'pgadmin3':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }
  #brew
  package { 'groovy':
    provider => 'homebrew',
    ensure => 'latest'
  }
  package { 'maven':
    provider => 'homebrew',
    ensure => 'latest'
  }
  package { 'tomcat':
    provider => 'homebrew',
    ensure => 'latest'
  }
  package { 'redis':
    provider => 'homebrew',
    ensure => 'latest'
  }
  package { 'solr':
    provider => 'homebrew',
    ensure => 'latest'
  }
}
