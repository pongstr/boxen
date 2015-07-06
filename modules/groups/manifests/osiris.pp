 # Osiris: Installation Setup for System Administrators

class groups::osiris {
  notify { 'Hello Osiris Member, we\'re setting up your workstations': }

  include chrome
  include firefox
  include hipchat
  include dashlane
  include sublime_text
  include vlc
  include virtualbox
  include iterm2::stable
  include mysql
  include github_for_mac
  include boot2docker
  include sourcetree
  include python
  include boot2docker
  include zsh

  package { 'vim': ensure => present, }

  mysql::db { 'database': }

  vagrant::box { 'squeeze64/vmware_fusion':
    source => 'https://s3.amazonaws.com/github-ops/vagrant/squeeze64-6.0.7-vmware_fusion.box'
  }

  package { 'mysqlworkbench':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }

  package { 'atom':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }
}
