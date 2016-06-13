syntax on
set nocompatible
set backspace=2
set clipboard+=unnamedplus,unnamed
set title
set number
set laststatus=2
set cmdheight=2
silent! colorscheme jellybeans

" keybind
inoremap <silent> jj <ESC>

" encodings
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,sjis
set fileformats=unix,dos,mac

" backup
set nobackup
"set writebackup
"set backupskip = escape(expand('$HOME'), '\') . '/tmp/*'
augroup Backup
  autocmd!
  autocmd BufWritePre * let &backupext = '-' . strftime("%Y%m%d_%H%M")
augroup END
if has('win32') || has('win64')
  set backupdir=$VIM/backup
else
  set backupdir=$HOME/.vim/backup
endif

" swapfile
set swapfile
if has('win32') || has('win64')
  set directory=$VIM/swap
else
  set directory=$HOME/.vim/swap
endif
set updatecount=500

" dein.vim
if filereadable(expand('~/dotfiles/.vimrc.dein'))
  source ~/dotfiles/.vimrc.dein
endif
