class people::melton14 {

  require groups::osiris
  notify { 'Hello ${::boxen_user}': }

}
