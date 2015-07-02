 # Osiris: Installation Setup for System Administrators

class groups::osiris {
  notify { 'Hello Osiris Member, we\'re setting up your workstations': }

  include chrome
  include firefox
  include hipchat
  include dashlane
  include sublime_text
  #include atom
  include vlc
  include virtualbox
  include iterm2::stable
  include mysql
      mysql::db { 'database': }

      vagrant::box { 'squeeze64/vmware_fusion':
        source => 'https://s3.amazonaws.com/github-ops/vagrant/squeeze64-6.0.7-vmware_fusion.box'
      }

      package { 'boot2docker': provider => 'homebrew' }
}
