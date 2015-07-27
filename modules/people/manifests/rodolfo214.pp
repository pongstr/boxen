class people::rodolfo214 {

  require groups::osiris
  notify { 'Hello ${::boxen_user}': }

}
