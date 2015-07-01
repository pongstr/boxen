# Mjolnir: Installation Setup for Front-end Developers

class groups::mjolnir {
  notify { 'Hello Team Mjolnir (Front-end Developers)': }

  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/my"
  $dotfiles = "${my}/dotfiles"

  file { $my:
    ensure  => directory
  }

  # Ruby Version and Ruby Gems
  $ruby = "2.1.2"
  ruby::version { '${ruby}': }

  ruby_gem { 'bundler':
    gem => 'bundler',
    ruby_version => ${ruby},
  }

  ruby_gem { 'rb-gsl':
    gem          => 'rb-gsl',
    ruby_version => ${ruby},
  }

  ruby_gem { 'bootstrap-sass':
    gem          => 'bootstrap-sass',
    ruby_version => ${ruby},
  }

  ruby_gem { 'compass':
    gem          => 'compass',
    ruby_version => ${ruby},
  }

  ruby_gem { 'github-pages':
    gem          => 'github-pages',
    ruby_version => ${ruby},
  }

  # Node.js and Global Node Modules
  nodejs::version { 'v0.12': }
  nodejs::module { 'bower': node_version => 'v0.12' }
  nodejs::module { 'express': node_version => 'v0.12' }
  nodejs::module { 'grunt-cli': node_version => 'v0.12' }
  nodejs::module { 'gulp': node_version => 'v0.12' }
  nodejs::module { 'jshint': node_version => 'v0.12' }
  nodejs::module { 'karma-cli': node_version => 'v0.12' }
  nodejs::module { 'less': node_version => 'v0.12' }
  nodejs::module { 'strongloop': node_version => 'v0.12' }
  nodejs::module { 'mean-cli': node_version => 'v0.12' }
  nodejs::module { 'mongoose': node_version => 'v0.12' }
  nodejs::module { 'nodemon': node_version => 'v0.12' }
  nodejs::module { 'pm2': node_version => 'v0.12' }
  nodejs::module { 'shelljs': node_version => 'v0.12' }

  # Other Stuff
  include dashlane
  include hipchat
  include vlc

  # Browsers
  include chrome
  include chrome::canary
  include chrome::chromium
  include firefox

  # Devtools and Dependencies
  include atom
  include docker
  include mongodb
  include nginx
  include python
  include submlime_text
  include virtualbox
  include webstorm
  include zsh

  # RoboMongo fetch from brewcask since it's
  # not available via boxen/puppet-*
  package { 'robomongo': provider => 'brewcask' }

  # Oh-my-zsh. Because Fuck Yeah
  file { "/Users/${my_username}/.oh-my-zsh":
    ensure  => link,
    target  => "${my}/oh-my-zsh",
    require => Repository["${my}/oh-my-zsh"]
  }

}
