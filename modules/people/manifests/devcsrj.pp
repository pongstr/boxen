
class people::devcsrj {

  # Back-end Developer Classification
  require groups::vishnu

  require nodejs
  require ruby

  include tunnelblick

  notify { "Hello ${::boxen_user}, Let's get you bootstrapped.": }
  notify { "We're now going to run the setup to make you feel at home.": }

  # Node.js Global Version
  # ----------------
  class { 'nodejs::global':
    version => 'v0.12.5'
  }

  # Global Node Modules
  # ----------------
  nodejs::module { 'bower':
    node_version => 'v0.12.5'
  }

  nodejs::module { 'grunt-cli':
    node_version => 'v0.12.5'
  }

  nodejs::module { 'nodemon':
    node_version => 'v0.12.5'
  }

  nodejs::module { 'shelljs':
    node_version => 'v0.12.5'
  }
}
