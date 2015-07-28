
class people::impakt {

  # Applications for Daren Klamer Only

  include tunnelblick
  include sublime_text
  include textwrangler
  include virtualbox

  notify { "Hello ${::boxen_user}, Let's get you bootstrapped.": }
  notify { "We're now going to run the setup to make you feel at home.": }

  package { 'intellij-idea':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries','--appdir=/Applications'],
  }

  package { 'java':
    ensure          => installed,
    provider        => 'brewcask',
  }

  package { 'filezilla':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries','--appdir=/Applications'],
  }

  package { 'skype':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries','--appdir=/Applications'],
  }

  package { 'remote-desktop-manager':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries','--appdir=/Applications'],
  }


}
