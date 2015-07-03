# Osiris: Installation Setup for Front-end Developers

class groups::mjolnir {
  notify { 'Hello Mjolnir member, we\'re setting up your shit, sit back and relax.': }

  include brewcask
  include chrome
  include chrome::canary
  include dashlane
  include firefox
  include hipchat
  include nginx
  include mongodb
  include sublime_text
  include webstorm::yosemite
  include zsh

  # Ruby Global Version
  # -------------------

  # TODO: Uncomment for first run
  # For the guys saving battery life, make sure
  # services are only running when its needed.
  # service { 'mongodb': ensure => 'stopped', }
  # service { 'nginx': ensure => 'stopped', }

  # TODO: Find a way how to run everything
  # else first before executing the line otherwise
  # error or warning is thrown: `rbenv` is not
  # present or something...

  # exec { 'set global ruby version':
  #   command => 'rbenv global 2.1.2'
  # }

  # TODO: Uncomment for first run
  # Global Ruby Gems
  # ----------------
  # make sure to specify `ruby_version`, using `*`
  # will install all gems on all versions that are installed
  ruby_gem { 'bundler for all rubies':
    gem          => 'bundler',
    version      => '~> 1.0',
    ruby_version => '2.1.2',
  }

  ruby_gem { 'bootstrap sass':
    gem          => 'bootstrap-sass',
    ruby_version => '2.1.2',
  }

  ruby_gem { 'sass compass':
    gem          => 'compass',
    ruby_version => '2.1.2',
  }

  ruby_gem { 'zurb foundation':
    gem          => 'foundation',
    ruby_version => '2.1.2',
  }

  ruby_gem { 'github-pages':
    gem          => 'github-pages',
    ruby_version => '2.1.2',
  }



  # Node.js Global Version
  # ----------------
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
    ensure   => installed
  }

  package { 'atom':
    provider => 'brewcask',
    ensure   => installed,
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }

  # buggy at the moment, throws
  # Error: Execution of 'brew cask install github' returned 1
  # package { 'github': provider => 'brewcask' }

  # Oh-My-ZSH
  exec { 'install oh-my-zsh plugin':
    command => "curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh",
    onlyif => [
      "test ! -d ${home}/.oh-my-zsh"
    ]
  }

  include projects::mjolnir::apiexplorer
  include projects::mjolnir::coder.io
  include projects::mjolnir::uikit
}
