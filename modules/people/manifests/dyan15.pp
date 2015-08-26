class people::dyan15 {

  require groups::ganesha
  notify { 'Hello ${::boxen_user}': }

}
