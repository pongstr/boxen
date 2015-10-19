Our Boxen
---

Okay, before even reading further below, Make sure you have XCode installed and
had verified installation via gui first! and then install XCode Commandline tools
via gui!! once done, read further below to proceed with Boxen.

If you already have an idea what Boxen is what this repo does,
please proceed to [Bootstrapping](#bootstrapping) otherwise you may
head to [boxen/our-boxen](https://github.com/boxen/our-boxen) to get
an idea how it works and the benefits of having it.

## Bootstrapping

1. Go to TORO-IO Boxen web: [https://toro-boxen.herokuapp.com](https://toro-boxen.herokuapp.com)
1. Login using your Github account
1. Copy + Paste the one liner to your Terminal
1. Grab a coffee

**Or Manually**

```
$ sudo mkdir -p /opt/boxen
$ sudo chown ${USER}:staff /opt/boxen
$ git clone https://github.com/toroio/boxen.git /opt/boxen/repo && cd /opt/boxen/repo

# Run the Bootstrap
$ ./script/boxen-bootstrap

# Run Boxen
# @param: --no-fde # skip filevault disk encryption
# @param: --debug  # see the behind the scene action
$ ./script/boxen
```

once done, you may add the line below to your config file:
`.zshrc` or `.bashrc`

```bash
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
```

Once your shell is ready, open a new tab/window in your Terminal
and you should be able to successfully run `boxen --env`.
If that runs cleanly, you're in good shape.

Per-User Customization
--

You may use hiera configuration when adding specific packages or modules, but please
do take not of the definitions so you can have a good understanding and utilize its purpose;

In order to add you customization, you'll have to create a file,
`hiera/users/#{github_username}`, with config entries [here](hiera/users/README.md).


Generating SSH-Keys for Github & Bitbucket
---

As of now, this process is not included yet ([why](https://github.com/TORO-IO/boxen/issues/73)).
But you may smoothly set this up by using this [dotfile](https://github.com/pongstr/dotfiles/blob/master/init/.gituser)
like so:

```bash
# Download the file
$ curl -L -o setup https://raw.githubusercontent.com/pongstr/dotfiles/master/init/.gituser

# Make it executable and run it, follow instructions and you're golden
$ chmod +x setup && ./setup
```

Frequently Asked Questions
---

You may find common questions and answers [here](docs/faq.md).
