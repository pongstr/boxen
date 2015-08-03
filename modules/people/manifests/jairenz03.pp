class people::jairenz03 {

  require groups::osiris
  notify { 'Hello ${::boxen_user}': }

}
