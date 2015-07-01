 # Osiris: Installation Setup for System Administrators

class groups::osiris {
  notify { 'Hello Osiris Member, we\'re setting up your workstations': }

<<<<<<< HEAD
include chrome
include chrome::canary
include atom
=======
  include chrome
  include chrome::canary
  include atom
>>>>>>> boxen-reload
}
