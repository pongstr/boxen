class people::supraromero {

  # Back-end Developer Classification
  require groups::vishnu
  require drivers:displaylink

  notify { "Hello ${::boxen_user}, Let's get you bootstrapped.": }
  notify { "We're now going to run the setup to make you feel at home.": }

}
