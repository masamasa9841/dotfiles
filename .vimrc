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
function! MY_CR_FUNC()
    let presentchar = getline(".")[col(".")-1]
    let prevchar = getline(".")[col(".")-2]
    if presentchar == "}" && prevchar == "{"
        return "\<CR>\<TAB>\<CR>\<UP>\<RIGHT>"
    else
        return "\<CR>"
    endif
endfunction
inoremap <silent> jj <ESC>
inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
imap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><CR> pumvisible() ? neocomplcache#close_popup() : MY_CR_FUNC()
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
xmap <C-k> <Plug>(neosnippet_expand_target)  
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

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

