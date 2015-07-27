class people::melton14 {

  require groups::osiris
  notify { 'Hello ${::boxen_user}': }

  include zsh

  exec { 'install oh-my-zsh plugin':
    command => "curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh",
    onlyif => [
      "test ! -d ${home}/.oh-my-zsh"
    ]
  }

}
