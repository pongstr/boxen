class people::jordz18 {

  require groups::osiris
  notify { 'Hello ${::boxen_user}': }

}
