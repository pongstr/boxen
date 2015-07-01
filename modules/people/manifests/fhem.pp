class people::fhem {
  require groups::osiris
  notify { 'Hello ${::boxen_user}': }
  require groups::osiris
}
