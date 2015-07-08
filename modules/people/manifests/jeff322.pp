class people::jeff322 {
  require groups::osiris
  notify { 'Hello ${::boxen_user}': }

  package { 'java':
     ensure     => installed,
     provider   => 'brewcask',
   }

  package { 'sqldeveloper':
    ensure   => installed,
    provider => 'compressed_app',
    source   => 'http://192.168.21.151/sqldeveloper-4.1.1.19.59-macosx.app.zip'
  }
}
