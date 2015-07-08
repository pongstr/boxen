class people::marinela25 {
  require groups::shiva
  notify { 'Hello ${::boxen_user}': }

}
