class people::jbarnette {
  include "mongodb"
  include "webstorm"

  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/my"
  $dotfiles = "${my}/dotfiles"

  file { $my:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => 'pongstr/dotfiles',
    require => File[$my]
  }
}
