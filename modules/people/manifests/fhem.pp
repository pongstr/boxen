class people::fhem {
  notify { 'Hello ${::boxen_user}': }
  require groups::osiris
}
