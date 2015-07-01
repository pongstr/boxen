
class people::pongstr {
  require groups::mjolnir
  notify { "Hello ${::boxen_user}": }

}
