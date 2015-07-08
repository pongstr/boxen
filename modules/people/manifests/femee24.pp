class people::femee24 {
  require groups::shiva
  notify { 'Hello ${::boxen_user}': }
}
