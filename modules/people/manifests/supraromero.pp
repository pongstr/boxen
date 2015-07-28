
class people::supraromero {

  # Back-end Developer Classification
  require groups::shiva
  require drivers:displaylink

  notify { "Hello ${::boxen_user}, Let's get you bootstrapped.": }
  notify { "We're now going to run the setup to make you feel at home.": }

  package { 'remote-desktop-manager':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries','--appdir=/Applications'],
  }
}
