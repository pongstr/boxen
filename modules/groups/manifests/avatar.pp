# AVATAR: shiva-child like setup for BACKEND OJT

class groups::avatar {

  notify { 'Hello AVATAR member, Let\'s set you up.': }

  package { 'eclipse-jee':
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
  
  package { 'sts':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--appdir=/Applications'
    ],
  }
  
  package { 'sourcetree':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--appdir=/Applications'
    ],
  }
  
  package { 'sublime-text':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--appdir=/Applications'
    ],
  }
  
  package { 'virtualbox':
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
