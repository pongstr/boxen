class people::josie109 {

  require groups::ganesha
  notify { 'Hello ${::boxen_user}': }

}
