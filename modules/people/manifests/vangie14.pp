class people::vangie14 {

  require groups::ganesha
  notify { 'Hello ${::boxen_user}': }

}
