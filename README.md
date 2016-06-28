dotfiles
========
my dotfiles

[![license](https://img.shields.io/github/license/tiryoh/dotfiles.svg?maxAge=2592000)]()
[![GitHub issues](https://img.shields.io/github/issues/tiryoh/dotfiles.svg?maxAge=2592000)]()
[![Travis](https://img.shields.io/travis/tiryoh/dotfiles.svg?maxAge=2592000)]()

##Table of Contents

* Requirements
* Usage
* License

## Requirements

requires the following to run:

* Vim 7.4

## Usage

* git clone

```
git clone https://github.com/tiryoh/dotfiles.git
```

* backup original vim settings

```
mkdir $HOME/vimorg && mv $HOME/.vimrc $HOME/vimorg/ && mv $HOME/.vim $HOME/vimorg/
```

* move to `dotfiles` dir and install `dein.vim`

```
cd $HOME/dotfiles && make deinvim
```

* install new vim settings

```
make vim
```

done!!!

## License

dotfiles are licensed under the MIT license.
Copywrite (c) 2016 Tiryoh
