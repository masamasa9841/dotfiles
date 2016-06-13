.PHONY: vim prezto deinvim

all:


prezto:
	bash ./etc/init/install_prezto.sh

vim:
	ln -s ${PWD}/.vim ${HOME}/
	ln -s ${PWD}/.vimrc ${HOME}/.vimrc
	mkdir ${HOME}/.vim/swap
	mkdir ${HOME}/.vim/backup
	mkdir ${HOME}/.vim/dict

deinvim:
	bash ./etc/init/install_deinvim.sh

tmux:
	ln -s ${PWD}/.tmux.conf ${HOME}/.tmux.conf
