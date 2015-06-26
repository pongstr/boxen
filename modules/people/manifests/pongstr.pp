class people::pongstr {
  include mongodb
  include webstorm

  # just a notification that my settings
  # are declared when boxen run
  notify { "class people::pongstr declared" }

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
