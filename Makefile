.PHONY: vim prezto deinvim

all:


prezto:
	./etc/init/install_prezto.sh

vim:
	ln -s ${PWD}/.vim ${HOME}/
	ln -s ${PWD}/.vimrc ${HOME}/.vimrc

deinvim:
	./etc/init/install_deinvim.sh
