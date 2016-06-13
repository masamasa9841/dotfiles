dotfiles
========

## How to use

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
