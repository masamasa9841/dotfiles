#!/bin/bash
if [ -a ${HOME}/.bashrc ]; then mv ${HOME}/.bashrc ${HOME}/.bashrc.bak; fi;
if [ -a ${HOME}/.bash_profile ]; then mv ${HOME}/.bash_profile ${HOME}/.bash_profile.bak; fi;
