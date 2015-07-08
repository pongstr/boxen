class people::femee24 {
  require groups::osiris
  notify { 'Hello ${::boxen_user}': }

  package { 'adobe-creative-cloud':
    ensure          => installed,
    provider        => 'brewcask',
    install_options => ['--no-binaries'],
  }
}
