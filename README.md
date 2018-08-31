scr
====
A simple script to create and reattach to [screen](https://ss64.com/bash/screen.html) session unique by name

Use case
---
Sometimes I screw up creating a new screen session (`screen -S session_name`) instead of reattaching (`screen -rx session_name`). This simple script is made to help simplify that.

Let's create a new screen session, named "service", run the background process, and then detach.

```sh
scr service
# ... run the background process
# detach using Ctrl+a d
```
When we want to reattach, we simply run
```sh
scr service
# will reattach to previous 'service' session,
# without creating a new one
```
It will always reattach to the same session, until that session is terminated
```sh
# inside session 'service'
exit # terminate session
scr service # will create a new session
```
It also matches strictly by name instead of pattern
```sh
scr serv
# will create a new session 'serv',
# instead of reattaching to session 'service'
```

Installation
---
Clone this repo, and run:
```sh
sudo cp scr.sh /usr/local/bin/scr

# for tab completion support
sudo cp scr-completion.sh /etc/bash_completion.d/scr
```
