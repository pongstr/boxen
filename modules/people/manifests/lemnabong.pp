
class people::lemnabong {

  # Back-end Developer Classification
  require groups::shiva

  notify { "Hello ${::boxen_user}, Let's get you bootstrapped.": }
  notify { "We're now going to run the setup to make you feel at home.": }

  package { 'spectacle':
    ensure   => installed,
    provider => 'compressed_app',
    source   => 'https://s3.amazonaws.com/spectacle/downloads/Spectacle+0.8.10.zip'
  }
}
