Tmux Env
========

|Communication|
|:-----------:|
| [![Join the gitter chat at https://gitter.im/pearl-core/pearl](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/pearl-core/pearl?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) |

**Table of Contents**
- [Description](#description)
- [Quickstart](#quickstart)
- [Installation](#installation)
- [Troubleshooting](#troubleshooting)

Description
===========
- name: `tmux-env`
- description: Treat Tmux as a simple and powerful IDE
- author: Filippo Squillace
- username: fsquillace
- OS compatibility: linux, osx

Quickstart
==========
Suppose to have a tmux session named *mysession*, `tmux-env` allows you
to describe the session structure with pre-defined panes
and windows.

For instance, in order to create the *mysession* with two windows, the first one
with a Vim editor and second one with two panes having respectively the python web server and
the ranger file manager, write the following in `$TMUX_ENVS_DIR/mysession`:

```sh
if [ $TMUX_WINDOW_INDEX -eq 1 ]
then
    tmux rename-window VIM
    vim
fi
if [ $TMUX_WINDOW_INDEX -eq 2 ]
then
    tmux rename-window WEBSERVER
    [ $TMUX_PANE_INDEX -eq 1 ] && python -m http.server
    [ $TMUX_PANE_INDEX -eq 2 ] && ranger
fi
```

To create the *mysession* session:
```sh
tmux new -s mysession
```

Now, every time you create the panes/windows, they will be
automatically generated according to the structure described in the file.

In this way the tmux session will be easily restored after restarts.

The environment variables provided by `tmux-env` for building the customized environment are:

- `TMUX_SESSION_NAME`: The name of the current Tmux session
- `TMUX_WINDOW_INDEX`: The index of the current Tmux window
- `TMUX_PANE_INDEX`: The index of the current Tmux pane

In order to apply a structure to **all** Tmux sessions write the structure in the special file `$TMUX_ENVS_DIR/default`.

Installation
============
This package can be installed via [Pearl](https://github.com/pearl-core/pearl) system.

```sh
pearl install tmux-env
```

Dependencies
------------
The main dependencies are the following:

- [Pearl](https://github.com/pearl-core/pearl)
- [GNU coreutils](https://www.gnu.org/software/coreutils/)

Troubleshooting
===============
This section has been left blank intentionally.
It will be filled up as soon as troubles come in!
