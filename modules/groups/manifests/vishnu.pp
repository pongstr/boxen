# Private: For Vishnu Personal Config only
#
# Usage:
#
#   include groups::vishnu


class groups::vishnu (
  $includes          = ['diffmerge', 'mysql', 'netbeans::jee', 'postgresapp', 'redis', 'solr', 'sourcetree', 'springtoolsuite', 'sqlpowerarchitect', 'sublime_text', 'textwrangler', 'vagrant', 'virtualbox'],
  $casks             = ['dbvisualizer', 'eclipse-jee', 'jenv', 'jd-gui', 'mysqlworkbench', 'pgadmin3'],
  $osx_apps          = undef,
  $homebrew_packages = ['ant', 'groovy', 'maven32', 'tomcat' ],
)
{
  include boxen::config

  $manifests = "${boxen::config::repodir}/modules/people/manifests"
  $login     = regsubst($boxen::config::login, '-','_', 'G')
  $merge_hierarchy = $boxen::config::hiera_merge_hierarchy

  if $login != $boxen::config::login {
    notice("Changed boxen::personal login to ${login}")
  }
  if file_exists("${manifests}/${login}.pp") {
    include "people::${login}"
  }


  # If $includes looks like ['foo', 'bar'], behaves like:
  # class { 'foo': }
  # class { 'bar': }
  $_includes = $merge_hierarchy ? {
    true      => hiera_array("${name}::includes",undef),
    default   => $includes
  }

  ensure_resource('class', $_includes)

  if $merge_hierarchy {
    $merged_osx_apps = hiera_array("${name}::osx_apps",undef)
    $merged_casks = hiera_array("${name}::casks",undef)

    $_casks = $merged_osx_apps ? {
      undef   => $merged_casks,
      default => $merged_osx_apps
    }
  }
  else {
    # $casks and $osx_apps are synonyms. $osx_apps takes precedence
    $_casks = $osx_apps ? {
      undef   => $casks,
      default => $osx_apps
    }
  }

  # If any casks/osx_apps are specified, declare them as brewcask packages
  if count($_casks) > 0 { include brewcask }
  ensure_resource('package', $_casks, {
    'provider'        => 'brewcask',
    'install_options' => ['--appdir=/Applications',
                          "--binarydir=${boxen::config::homebrewdir}/bin"],
  })

  # If any homebrew packages are specified , declare them
  $_homebrew_packages = $merge_hierarchy ? {
    true      => hiera_array("${name}::homebrew_packages",undef),
    default   => $homebrew_packages
  }
  ensure_resource('package', $_homebrew_packages, {
    'provider' => 'homebrew',
  })


  ## Oh-My-ZSH
  exec { 'install oh-my-zsh plugin':
    command => "curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh",
    unless  => ["test -d /Users/${USER}/.oh-my-zsh"]
  }

}
