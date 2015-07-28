
class people::supraromero {

  # Back-end Developer Classification
  require groups::shiva

  notify { "Hello ${::boxen_user}, Let's get you bootstrapped.": }
  notify { "We're now going to run the setup to make you feel at home.": }

  package { 'displaylink-driver':
    ensure   => installed,
    provider => 'pkgdmg',
    source   => 'http://192.168.21.151/DisplayLink_OSX_2.4.dmg'
  }

  package { 'remote-desktop-manager':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries','--appdir=/Applications'],
  }
}
