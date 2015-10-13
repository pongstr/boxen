# Per-user hiera configuration

The example `hiera.yaml` includes an entry in the hierarchy for
per-user configurations, allowing individuals to override many, many
common puppet parameters for their own machines.

Simply place a file in this directory named after your github
login. For example, if your github login is `johndoe`, you would edit
the file `johndoe.yaml` here.

Example
---

```yaml

# Add a Homebrew Packages
# ---------------------------
# You might want to read: http://git.io/vCzlI for more info, but as a summary
# these are packages that aren't provided from the app store, these aren't
# pre-compiled and yes you build them from source.

boxen::personal::homebrew_packages:
  - gcc     # installs GNU Compiler Collection
  - jenv    # Java Environment Manger
  - wget    # Internet file retriever


# Add a native OSX App
# -------------------
# Install a native OSX application, if you're uncertain how these apps
# are named, you may run `$ brew update && brew upgrade cask` to get the latest
# greatest list of new things, you may search using
# `$ brew cask search {#app_name}` to get an exact match  or just list
# everyting using `$ brew cask search`

boxen::personal::osx_app:
  - dockertoolbox
  - firefoxdeveloperedition
  - torbrowser


# Add a puppet-module
# --------------------
boxen::personal::includes:
  - mongodb
  - nodejs
  - redis


# With what's declared above, you may now utilize the module's
# distributable environment settings for your team/project.
# You might need to check if the module supports config settings

# MongoDB Env Settings
mongodb::config:
  host: '127.0.0.1'
  port: '27017'
  version: '3.0.6-boxen1'

# Node.js Env Settings
nodejs::global::version: "4.1.2"
nodejs::version::alias:
  "0.12": "0.12.7"
  "4.1": "4.1.2"

# Redis Env Settings
redis::config:
  host: '127.0.0.1'
  port: 16379
  version: '3.0.4-boxen1'
```

As of common config, you may create a PR and we'll see if it's worth to merge.
