class people::cj02 {

  require groups::osiris
  notify { 'Hello ${::boxen_user}': }

}
