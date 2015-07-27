class people::charm29 {

  require groups::ganesha
  
  notify { 'Hello ${::boxen_user}': }

}
