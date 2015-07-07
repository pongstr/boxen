Our boxen
===

If you already have an idea what Boxen is what this repo does,
please proceed to [Bootstrapping](#bootstrapping) otherwise you may
head to [boxen/our-boxen](https://github.com/boxen/our-boxen) to get
an idea how it works and the benefits of having it.

## Bootstrapping

```
$ sudo mkdir -p /opt/boxen
$ sudo chown ${USER}:staff /opt/boxen
$ git clone https://github.com/pongstr/boxen.git /opt/boxen/repo && cd /opt/boxen/repo

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
