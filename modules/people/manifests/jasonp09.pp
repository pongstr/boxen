class people::jasonp09 {

  require groups::osiris
  notify { 'Hello ${::boxen_user}': }

}
