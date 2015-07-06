
class people::pongstr {

  # Front-end Developer Classification
  require groups::mjolnir

  package { 'vim':
    ensure          => present,
    install_options => ['--override-system-vi']
  }

  notify { "Hello ${::boxen_user}, Let's get you bootstrapped.": }
  notify { "We're now going to run the setup to make you feel at home.": }

  $home     = "/Users/${::boxen_user}"
  $projects = "${home}/Projects"
  $dotfiles = "${home}/.dotfiles"
  $ohmyzsh  = "${home}/.oh-my-zsh"
  $sublime  = "${home}/Library/Application Support/Sublime Text 3/Packages/"

  # Initialize Dotfiles Location
  file { $dotfiles:
    ensure => directory,
  }

  # Fetch Dotfiles from Repository
  repository { $dotfiles:
    path     => $dotfiles,
    ensure   => 'origin/boxen',
    source   => 'pongstr/dotfiles',
    provider => 'git',
  }

  # Fetch Custom Spacegray Theme
  repository { $sublime:
    path     => "${sublime}/Theme - Spacegray",
    ensure   => 'origin/master',
    source   => 'pongstr/spacegray',
    provider => 'git',
  }


  # Create Vim Directory for all vim related stuff
  $vim = [
    "${home}/.vim",
    "${home}/.vim/backups",
    "${home}/.vim/colors",
    "${home}/.vim/swaps",
    "${home}/.vim/undo",
  ]

  # Vim: Directories
  file { $vim:
    ensure => directory,
    owner => $boxen_user,
    group => 'staff',
    mode  => '0755',
  }

  # Vim: Link .vimrc from pongstr/dotfiles
  file { "${home}/.vimrc":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles}/bin/vim/.vimrc",
  }

  # Vim: Link Pongstr Base-16 theme
  file { "${home}/.vim/colors/Pongstr Base-16.vim":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles}/bin/vim/Pongstr Base-16.vim",
    require => Repository[$dotfiles],
  }

  # Zsh: Link .zshrc settings
  file { "${home}/.zshrc":
    ensure  => link,
    mode    => '0755',
    target  => "${dotfiles}/bin/shell/.zshrc",
    require => Repository[$dotfiles],
  }

  # Zsh: Link Zsh Pongstr Base-16 Theme
  file { "${ohmyzsh}/themes/pongstr.zsh-theme":
    ensure  => link,
    mode    => '0755',
    target  => "${dotfiles}/bin/shell/Pongstr Base-16.zsh-theme",
    require => Repository[$dotfiles],
  }


  file { "${sublime}/User/Preferences.sublime-settings":
    ensure => present,
    mode   => '0755',
    group   => 'staff',
    source  => "${dotfiles}/bin/subl/Preferences.sublime-settings",
    require => Repository[$dotfiles],
  }

  file { "${sublime}/User/Default (OSX).sublime-keymap":
    ensure => present,
    mode   => '0755',
    group   => 'staff',
    source  => "${dotfiles}/bin/subl/Default (OSX).sublime-keymap",
    require => Repository[$dotfiles],
  }

  file { "${sublime}/User/Package Control.sublime-settings":
    ensure  => present,
    mode    => '0755',
    group   => 'staff',
    source   => "${dotfiles}/bin/subl/Package Control.sublime-settings",
    require => Repository[$dotfiles],
  }

  # OSX Preferences
  # ---------------

  # Enable Right-Click on Magic Mouse
  class { 'osx::mouse::button_mode': mode => 2 }
  class { 'osx::mouse::swipe_between_pages': enabled => true }

  # Setting a blazingly fast keyboard repeat rate
  # (ain't nobody got time fo special chars while coding!)
  class { 'osx::global::key_repeat_rate': rate => 0 }

  # Set Dock Icon Size to 32px
  class { 'osx::dock::icon_size': size => 32 }

  # Hot Corners
  class { 'osx::dock::hot_corners':
    bottom_right => "Start Screen Saver"
  }

  # One Shot Defaults
  include osx::global::disable_autocorrect
  include osx::finder::enable_quicklook_text_selection
  include osx::global::expand_save_dialog
  include osx::safari::enable_developer_mode
  include osx::finder::show_hard_drives_on_desktop
  include osx::global::tap_to_click

  # TODO: Uncomment for first run
  # For the guys saving battery life, make sure
  # services are only running when its needed.
  service { 'dev.mongodb': ensure => 'stopped', }
  service { 'dev.nginx': ensure => 'stopped', }

  # Initialize Projects
  include projects::mjolnir::apiexplorer
  include projects::mjolnir::coderio
  include projects::mjolnir::uikit
}
