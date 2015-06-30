class people::pongstr {
  notify { 'hello pongstr': }

  include webstorm
  include mongodb
  include hipchat

  package { 'robomongo': provider => 'brewcask' }
}
