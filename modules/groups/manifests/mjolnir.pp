# Osiris: Installation Setup for Front-end Developers

class groups::mjolnir {
  notify { 'Hello Mjolnir member, we\'re setting up your shit, sit back and relax.': }

  include brewcask
  include dashlane
  include firefox
  include hipchat
  include sublime_text

  package { 'robomongo': provider => 'brewcask' }
  package { 'github': provider => 'brewcask' }

}
