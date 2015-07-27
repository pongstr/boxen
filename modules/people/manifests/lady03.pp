class people::lady03 {

  require groups::ganesha

  notify { 'Hello ${::boxen_user}': }

}
