class people::kimberly25 {

  require groups::ganesha

  notify { 'Hello ${::boxen_user}': }

}
