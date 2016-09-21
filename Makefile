.PHONY: all prezto vim vim-setup_for_docker deinvim bash tmux git pyenv

all:


prezto:
	/bin/zsh ./etc/init/install_prezto.sh

vim:
	ln -s ${PWD}/.vim ${HOME}/
	ln -s ${PWD}/.vimrc ${HOME}/.vimrc
	mkdir ${HOME}/.vim/swap
	mkdir ${HOME}/.vim/backup
	mkdir ${HOME}/.vim/dict

deinvim:
	/bin/bash ./etc/init/install_deinvim.sh

bash:
	/bin/bash ./etc/init/backup_bash.sh
	ln -s ${PWD}/.bashrc ${HOME}/.bashrc
	ln -s ${PWD}/.bash_profile ${HOME}/.bash_profile

tmux:
	ln -s ${PWD}/.tmux.conf ${HOME}/.tmux.conf

git:
	ln -s ${PWD}/.gitconfig ${HOME}/.gitconfig

pyenv:
	git clone https://github.com/yyuu/pyenv.git ${HOME}/.pyenv

