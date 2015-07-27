class people::teban20 {

  require groups::osiris
  notify { 'Hello ${::boxen_user}': }

}
