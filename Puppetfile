# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.10.4"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.6"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.2.1"
github "git",         "2.7.9"
github "go",          "2.1.0"
github "homebrew",    "1.12.0"
github "hub",         "1.4.1"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.7", :repo => "toro-io/puppet-nginx"
github "nodejs",      "4.0.1"
github "openssl",     "1.0.0"
github "phantomjs",   "2.4.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.4.1"
github "ruby",        "8.5.2"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "atom",                "1.2.0"
github "boot2docker",         "1.0.2", :repo => "toro-io/puppet-boot2docker"
github "chrome",              "1.2.0"
github "cyberduck",           "1.0.2", :repo => "toro-io/puppet-cyberduck"
github "dashlane",            "1.0.2", :repo => "toro-io/puppet-dashlane"
github "diffmerge",           "1.0.0", :repo => "toro-io/puppet-diffmerge"
github "eclipse",             "2.5.0"   # Deprecated: Use Spring Tool Suite instead
github "elasticsearch",       "2.7.2"
github "firefox",             "1.2.3"
github "hipchat",             "1.1.3"
github "iterm2",              "1.2.5"
github "java",                "1.8.3"
github "mongodb",             "1.3.4"
github "mysql",               "2.1.2"
github "netbeans",            "1.0.1", :repo => "toro-io/puppet-netbeans"
github "osx",                 "2.8.0"
github "python",              "2.0.0"
github "postgresapp",         "1.0.0", :repo => "toro-io/puppet-postgresapp"
github "postgresql",          "4.0.1"
github "redis",               "3.1.0"
github "soapui",              "1.0.0", :repo => "toro-io/puppet-soapui"
github "sourcetree",          "1.0.0"
github "springtoolsuite",     "1.2.0", :repo => "toro-io/puppet-springtoolsuite"
github "sqlpowerarchitect",   "1.0.0", :repo => "toro-io/puppet-sqlpowerarchitect"
github "sublime_text",        "1.1.0"
github "solr",                "1.0.4"
github "sysctl",              "1.0.1"
github "textwrangler",        "1.0.7", :repo => "toro-io/puppet-textwrangler"
github "tunnelblick",         "1.0.8", :repo => "pongstr/puppet-tunnelblick"
github "vagrant",             "3.3.0"
github "vlc",                 "1.1.0"
github "virtualbox",          "1.0.13"
github "wget",                "1.0.1"
github "webstorm",            "1.1.3", :repo => "toro-io/puppet-webstorm"
github "zsh",                 "1.0.0"
