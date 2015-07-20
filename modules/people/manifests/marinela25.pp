class people::marinela25 {
  require groups::ganesha

  notify { 'Hello ${::boxen_user}': }
}
