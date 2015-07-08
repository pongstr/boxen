 # Osiris: Installation Setup for System Administrators

class groups::osiris {
  notify { 'Hello Osiris Member, we\'re setting up your workstations': }

  $home = "/Users/${::boxen_user}"

  # include chrome              # Already included in Site Manifest (manifests/site.pp)
  # include dashlane            # Already included in Site Manifest (manifests/site.pp)
  # include firefox             # Already included in Site Manifest (manifests/site.pp)
  # include github_for_mac      # Deprecated as per github.com/boxen/puppet-github_for_mac
  # include hipchat             # Already included in Site Manifest (manifests/site.pp)
  # include vlc                 # Already included in Site Manifest (manifests/site.pp)
  include boot2docker
  include iterm2::stable
  include mysql
  include python
  include sourcetree
  include sublime_text
  include virtualbox
  include zsh

  package { 'vim':
    ensure          => present,
    install_options => [],
  }

  package { 'mysqlworkbench':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries'],
  }

  package { 'atom':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries'],
  }

  package { 'github':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries'],
  }

  package { 'Keynote':
    ensure   => installed,
    provider => 'compressed_app',
    source   => 'http://192.168.21.151/Keynote.zip'
  }

  # Team Osiris must consolidate Databases
  # and set them in `modules/projects/manifests/osiris.pp`
  # so they can only be checked out to the assigned
  # members of the group.
  # mysql::db { 'database': }

  # Vagrant Box Setup:
  vagrant::box { 'squeeze64/vmware_fusion':
    source => 'https://s3.amazonaws.com/github-ops/vagrant/squeeze64-6.0.7-vmware_fusion.box'
  }

  # Oh-My-ZSH
  exec { 'install oh-my-zsh plugin':
    command => "curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh",
    onlyif => [
      "test ! -d ${home}/.oh-my-zsh"
    ]
  }
}
