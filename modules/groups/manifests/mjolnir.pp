# Osiris: Installation Setup for Front-end Developers

class groups::mjolnir {
  notify { 'Hello Mjolnir member, we\'re setting up your shit, sit back and relax.': }

  include brewcask
  include chrome
  include chrome::canary
  include chrome::chromium
  include dashlane
  include firefox
  include hipchat
  include mongodb
  # include osx
  include sublime_text
  include zsh

  # Node.js Global Version
  class { 'nodejs::global':
    version => 'v0.12.5'
  }

  # Global Node Modules
  nodejs::module { 'bower':
    node_version => 'v0.12.5'
  }

  nodejs::module { 'coffee-script':
    node_version => 'v0.12.5'
  }

  nodejs::module { 'express':
    node_version => 'v0.12.5'
  }

  nodejs::module { 'grunt-cli':
    node_version => 'v0.12.5'
  }

  nodejs::module { 'gulp':
    node_version => 'v0.12.5'
  }

  nodejs::module { 'jshint':
    node_version => 'v0.12.5'
  }

  nodejs::module { 'karma-cli':
    node_version => 'v0.12.5'
  }

  nodejs::module { 'less':
    node_version => 'v0.12.5'
  }

  nodejs::module { 'strongloop':
    node_version => 'v0.12.5'
  }

  nodejs::module { 'mean-cli':
    node_version => 'v0.12.5'
  }

  nodejs::module { 'nodemon':
    node_version => 'v0.12.5'
  }

  nodejs::module { 'pm2':
    node_version => 'v0.12.5'
  }

  nodejs::module { 'shelljs':
    node_version => 'v0.12.5'
  }

  package { 'robomongo':
    provider => 'brewcask',
    ensure   => 'installed'
  }

  # buggy at the moment, throws
  # Error: Execution of 'brew cask install github' returned 1
  # package { 'github': provider => 'brewcask' }

}
