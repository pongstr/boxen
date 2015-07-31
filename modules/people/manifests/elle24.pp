class people::elle24 {

  ##this user is dedicated for a test machine only.
  require groups::osiris
  #require groups::mjolnir
  #require groups::vishnu
  notify { 'Hello ${::boxen_user}': }

}
