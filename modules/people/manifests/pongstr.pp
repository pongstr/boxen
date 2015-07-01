
class people::pongstr {

  require groups::mjolnir

  notify { "Hello ${::boxen_user}, Let's get you bootstrapped.": }

  $home     = "/Users/${::boxen_user}"
  $projects = "${home}/Projects"
  $dotfiles = "${home}/dotfiles"

  # Initialize Dotfiles Location
  file { $dotfiles:
    ensure => directory
  }

  # Fetch Dotfiles from Repository
  repository { $dotfiles:
    source  => 'pongstr/dotfiles',
    require => File[$dotfiles]
  }

  # Create Vim Directory for all vim related stuff
  exec { 'Create .vim directory':
    command     => "mkdir -p ${home}/.vim/.viminfo ${home}/.vim/backups ${home}/.vim/colors ${home}/.vim/swaps ${home}/.vim/undo",
    refreshonly => false
  }

  # Link .vimrc from dotfile
  file { $dotfiles:
    ensure  => link,
    mode    => '0644',
    target  => "{$home}/.vimrc",
    require => File["${dotfiles}/bin/vim/.vimrc"]
  }

  # Link Pongstr Base-16 theme
  file { $dotfiles:
    ensure  => link,
    mode    => '0644',
    target  => "${home}/.vim/colors/Pongstr Base-16.vim",
    require => File["${dotfiles}/bin/vim/Pongstr Base-16.vim"],
  }

}
