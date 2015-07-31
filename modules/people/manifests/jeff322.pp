class people::jeff322 {
  require groups::osiris
  notify { 'Hello ${::boxen_user}': }

}
