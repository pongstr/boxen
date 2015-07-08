class people::femee24 {
  require groups::osiris
  notify { 'Hello ${::boxen_user}': }

}
