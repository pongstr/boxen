class people::junnel09 {

  require groups::osiris
  notify { 'Hello ${::boxen_user}': }

}
