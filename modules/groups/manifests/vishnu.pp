# Vishnu: Installation Setup for Senior Backend Developers

class groups::vishnu {
  notify { 'Hello Vishnu member, Let\'s set you up.': }

  # include chrome              # Already included in Site Manifest (manifests/site.pp)
  # include dashlane            # Already included in Site Manifest (manifests/site.pp)
  # include firefox             # Already included in Site Manifest (manifests/site.pp)
  # include github_for_mac      # Deprecated as per github.com/boxen/puppet-github_for_mac
  # include hipchat             # Already included in Site Manifest (manifests/site.pp)
  # include vlc                 # Already included in Site Manifest (manifests/site.pp)

  include eclipse::java
  include netbeans::jee
  include sublime_text

  # package { 'squirrel-sql':
  #   ensure   => installed
  #   provider => 'jar',
  #   source   => 'http://nchc.dl.sourceforge.net/project/squirrel-sql/3-snapshots/snapshot-20150623_2101/squirrel-sql-snapshot-20150623_2101-MACOSX-install.jar'
  # }

  package { 'soap-ui':
    ensure   => installed
    provider => 'appdmg',
    source   => 'http://nchc.dl.sourceforge.net/project/soapui/soapui/5.2.0/SoapUI-5.2.0.dmg'
  }

  package { 'sqlpower architect':
    ensure   => installed,
    provider => 'zip',
    source   => 'http://download.sqlpower.ca/architect/1.0.7/community/SQL-Power-Architect-OSX-1.0.7.tar.gz'
  }
}
