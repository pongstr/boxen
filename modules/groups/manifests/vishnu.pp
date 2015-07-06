# Vishnu: Installation Setup for Senior Backend Developers

class groups::vishnu {
  notify { 'Hello Vishnu member, Let\'s set you up.': }

  include firefox
  include chrome
  include dashlane
  include hipchat
  include sublime_text
  include java

  # include eclipse::jee # installable, but fails at `chown`
  include netbeans
}
