# Shiva: Installation Setup for Junior Backend Developers

class groups::shiva {
  
  notify { 'Hello Shiva member, Let\'s set you up.': }

  include java
  include springtoolsuite
  include virtualbox
  include sublime_text

  package { 'eclipse-jee':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--appdir=/Applications'
    ],
  }

  package { 'jenv':
    ensure   => installed,
    provider => 'homebrew',
  }

  package { 'groovy':
    ensure   => 'latest',
    provider => 'homebrew',
  }

  package { 'maven':
    ensure   => 'latest',
    provider => 'homebrew',
  }
}
