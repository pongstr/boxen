class people::rkim01 {

  require groups::ganesha

  notify { 'Hello ${::boxen_user}': }

}
