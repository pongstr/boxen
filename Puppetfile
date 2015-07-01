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

# Core modules for a basic development environment.
# Modified defaults, only allow company approved apps.

github "brewcask",      "0.0.6"
github "foreman",       "1.2.0"
github "gcc",           "2.2.1"
github "git",           "2.7.9"
github "homebrew",      "1.12.0"
github "inifile",       "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "openssl",       "1.0.0"
github "pkgconfig",     "1.0.0"
github "repository",    "2.4.1"
github "ruby",          "8.5.2"
github "stdlib",        "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",          "1.0.0"

# Company Approved Applications
# Add reference link here:

# Browsers
github "chrome",        "1.2.0"
github "firefox",       "1.2.3"

# Text Editors and IDEs
github "atom"           "1.2.0"
github "eclipse"        "2.5.0"
github "netbeans",      "1.0.1"
github "submlime_text", "1.1.0"
github "webstorm"       "1.1.1"
github "textwrangler"   "1.0.6"

# Databases
github "elasticsearch", "2.8.0"
github "mongodb",       "1.4.0"
github "mysql",         "2.1.2"
github "postgresql",    "4.0.1"
github "redis",         "3.2.0"
github "solr",          "1.0.4"

# Platforms
github "nginx",         "1.4.5"
github "nodejs",        "4.0.1"
github "java",          "1.8.3"
github "python",        "2.0.0"

# Virtualisation
github "docker",        "0.9.0"
github "vagrant",       "3.3.0"
github "virtualbox",    "1.0.13"

# Tools and Other Stuff
github "hipchat",         "1.1.3"
github "dashlane",        "1.0.1"
github "zsh",             "1.0.0"
github "iterm2",          "1.2.5"
github "sourcetree",      "1.0.0"
github "vlc",             "1.1.0"
github "openoffice",      "1.2.0"
