# Vishnu: Installation Setup for Senior Backend Developers

class groups::vishnu {
  notify { 'Hello Vishnu member, Let\'s set you up.': }

  include firefox
  include chrome
  include dashlane
  include hipchat
  include vlc


#  include java
  include sublime_text
  include virtualbox
  include boot2docker
  include mysql
  include netbeans
  include github_for_mac
  include wget
  include zsh
  include postgresql


  # Oh-My-ZSH
  exec { 'install oh-my-zsh plugin':
    command => "curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh",
    onlyif => [
      "test ! -d ${home}/.oh-my-zsh"
    ]
  }

##brewcask
  package { 'atom':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }

  package { 'mysqlworkbench':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }
  # include eclipse::jee # installable, but fails at `chown`
  package { 'eclipse-ide':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }

  package { 'sts':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }
  package { 'diffmerge':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }

  package { 'dbvisualizer':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }
  package { 'textwrangler':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }
  package { 'pgadmin3':
    provider => 'brewcask',
    install_options => [
      '--force',
      '--no-binaries',
    ]
  }


  ## other Package
  exec { 'install-squirrel-sql': command => "java -jar squirrel-sql-snapshot-20150623_2101-MACOSX-install.jar" }

package { 'squirrel-sql':
  ensure   => installed
  source   => 'http://nchc.dl.sourceforge.net/project/squirrel-sql/3-snapshots/snapshot-20150623_2101/squirrel-sql-snapshot-20150623_2101-MACOSX-install.jar',
  require  => Require['install-squirrel-sql']
}

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

package { 'talend':
ensure => installed,
provider => 'compressed_app'
source => 'http://talend.dreamhosters.com/tos/release/V6.0.0/TOS_DI-20150702_1326-V6.0.0.zip'
}

  #brew
  package { 'groovy':
    provider => 'homebrew',
    ensure => 'latest'
  }
  package { 'maven':
    provider => 'homebrew',
    ensure => 'latest'
  }
  package { 'tomcat':
    provider => 'homebrew',
    ensure => 'latest'
  }
  package { 'redis':
    provider => 'homebrew',
    ensure => 'latest'
  }
  package { 'solr':
    provider => 'homebrew',
    ensure => 'latest'
  }
}
