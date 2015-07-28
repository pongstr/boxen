
class drivers::displaylink {
  package { 'displaylink-driver':
    ensure   => installed,
    provider => 'pkgdmg',
    source   => 'http://192.168.21.151/DisplayLink_OSX_2.4.dmg'
  }
}
