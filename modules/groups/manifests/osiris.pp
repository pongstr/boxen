 # Osiris: Installation Setup for System Administrators

class groups::osiris {
  notify { 'Hello Osiris Member, we\'re setting up your workstations': }

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

  # Team Osiris must consolidate Databases
  # and set them in `modules/projects/manifests/osiris.pp`
  # so they can only be checked out to the assigned
  # members of the group.
  # mysql::db { 'database': }

  # Vagrant Box Setup:
  vagrant::box { 'squeeze64/vmware_fusion':
    source => 'https://s3.amazonaws.com/github-ops/vagrant/squeeze64-6.0.7-vmware_fusion.box'
  }

}
