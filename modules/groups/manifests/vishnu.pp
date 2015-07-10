# Vishnu: Installation Setup for Senior Backend Developers

class groups::vishnu {
  
  notify { 'Hello Vishnu member, Let\'s set you up.': }

  $DL_SQUIRREL    = 'http://nchc.dl.sourceforge.net/project/squirrel-sql/3-snapshots/snapshot-20150623_2101/squirrel-sql-snapshot-20150623_2101-MACOSX-install.jar'
  $DL_TALEND      = 'http://talend.dreamhosters.com/tos/release/V6.0.0/TOS_DI-20150702_1326-V6.0.0.zip'

  include diffmerge
  include sqlpowerarchitect
  include mysql
  include netbeans::jee
  include postgresapp
  include redis
  include solr
  include soapui
  include springtoolsuite
  include sublime_text
  include textwrangler
  include vagrant
  include virtualbox

  package { 'eclipse-jee':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => [
      '--appdir=/Applications'
    ],
  }

  package { 'dbvisualizer':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => []
  }

  package { 'pgadmin3':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => []
  }

  package { 'mysqlworkbench':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => []
  }

  package { 'jenv':
    ensure   => installed,
    provider => 'homebrew',
  }

  package { 'groovy':
    ensure   => 'latest',
    provider => 'homebrew',
    require  => Package['java']
  }

  package { 'maven':
    ensure   => 'latest',
    provider => 'homebrew',
    require  => Package['java']
  }
  
  package { 'tomcat':
    ensure   => 'latest',
    provider => 'homebrew',
    require  => Package['java']
  }

  package { 'jd-gui':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries','--appdir=/Applications'],
  }

  # FIXME: Native-java installer
  # exec { 'install squirrel-sql':
  #   command => "java -jar ${DL_SQUIRREL}",
  #   onlyif  => []
  # }

  # FIXME: Too large ~600MB
  # package { 'talend':
  #  ensure   => installed,
  #  provider => 'compressed_app',
  #  source   => $DL_TALEND
  # }
}
