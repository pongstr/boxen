class people::mikhaila20 {
  require groups::ganesha

  notify { 'Hello ${::boxen_user}': }
}
