# Osiris: Installation Setup for Front-end Developers

class groups::mjolnir {
  require nodejs
  require ruby

  notify { 'Hello Mjolnir member, we\'re setting up your shit, sit back and relax.': }

  include chrome::canary
  include cyberduck
  include nginx
  include mongodb
  include python
  include sublime_text
  include virtualbox
  include webstorm::yosemite
  include zsh

  # Ruby Global Version
  # -------------------
  # class { 'ruby::global': version => '2.1.2' }

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

  # Install Native Apps via Brew-Cask
  # Apps are then installed in /opt/Caskroom
  # but are symlinked to /Applications Directory
  package { 'atom':
    provider => 'brewcask',
    ensure   => installed,
    install_options => ['--no-binaries']
  }

  # RoboMongo
  package { 'robomongo':
    provider => 'brewcask',
    ensure   => installed,
  }

  # Oh-My-ZSH
  exec { 'install oh-my-zsh plugin':
    command => "curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh",
    onlyif => [
      "test ! -d ${home}/.oh-my-zsh"
    ]
  }
}
