dotfiles
========
my dotfiles

[![license](https://img.shields.io/github/license/tiryoh/dotfiles.svg?maxAge=2592000)](./LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/tiryoh/dotfiles.svg?maxAge=2592000)](https://github.com/Tiryoh/dotfiles/issues)
[![Travis](https://img.shields.io/travis/tiryoh/dotfiles.svg?maxAge=2592000)](https://travis-ci.org/Tiryoh/dotfiles)

##Table of Contents

* Requirements
* Usage
* Vim Shortcuts
* License

## Requirements

requires the following to run:

  * Vim
    * make
    * curl
    * Vim 7.4 (+clipboard +lua)
  * bash
    * make
    * bash
  * tmux
    * make
    * tmux
  * git
    * make
    * git

## Usage
### Vim

* git clone scripts

```
git clone https://github.com/tiryoh/dotfiles.git
```

* archive original settings
  * vim
  
  ```
  mkdir $HOME/vimorg && mv $HOME/.vimrc $HOME/vimorg/ && mv $HOME/.vim $HOME/vimorg/
  ```
  
  * bash
  
  ```
  mv $HOME/.bashrc $HOME/.bashrc_org
  ```

  * tmux
  
  ```
  mv $HOME/.tmux.conf $HOME/.tmux.conf_org
  ```

* move to `dotfiles` dir and install new settings

```
cd $HOME/dotfiles
```

  * vim
    * install `dein.vim`

    ```
    make deinvim
    ```

    * install new vim settings

    ```
    make vim
    ```
  * bash
    * install new bashrc

    ```
    make bash
    ```

  * tmux
    * install new tmux.conf

    ```
    make tmux
    ```

  * git
  Don't forget to change user.email and user.name.

done!!!

## Vim Shortcuts

e.g.)
* [esc]
  * jj
* comment/comment out
  * gcc
* quick run
  * :Q

## tmux Shortcuts

* prefix key
  * Ctrl-b
* Open new window
  * prefix + c
* View window list
  * prefix + w
* Select next/previous window
  * prefix + n
  * prefix + p
  * prefix + Ctrl-l
  * prefix + Ctrl-h
* Move panes
  * prefix + {
  * prefix + }
  * prefix + Ctrl-o
* Select pane
  * prefix + l
  * prefix + k
  * prefix + j
  * prefix + h
* Resize pane
  * prefix + L
  * prefix + K
  * prefix + J
  * prefix + H
* Reload config
  * prefix + r

## License

dotfiles are licensed under the MIT license, see [LICENSE](./LICENSE).

Unless attributed otherwise, everything is under the MIT license.

Copyright (c) 2016 [Tiryoh](https://github.com/Tiryoh)

