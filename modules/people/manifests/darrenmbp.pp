
class people::darrenmbp {

  # Back-end Developer Classification
  require groups::vishnu

  include tunnelblick

  notify { "Hello ${::boxen_user}, Let's get you bootstrapped.": }
  notify { "We're now going to run the setup to make you feel at home.": }


  package { 'intellij-idea':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries','--appdir=/Applications'],
  }

  package { 'java6':
    ensure          => installed,
    provider        => 'brewcask',
  }

}
