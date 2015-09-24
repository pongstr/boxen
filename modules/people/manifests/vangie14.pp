class people::vangie14 {

  # Production build group
  require groups::ganesha

  notify { "Hello ${::boxen_user}, Let's get you bootstrapped.": }
  notify { "We're now going to run the setup to make you feel at home.": }

}
