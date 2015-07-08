class people::mikhaila20 {
  require groups::shiva
  notify { 'Hello ${::boxen_user}': }

}
