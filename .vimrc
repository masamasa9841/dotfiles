" run 'call dein#clear_state()' to force reload

" global settings
syntax on
set nocompatible title number cindent
set backspace=2
set clipboard+=unnamedplus,unnamed
set laststatus=2
set cmdheight=2

" colorscheme settings
"silent! colorscheme jellybeans
colorscheme elflord

" dein.vim
if &compatible
  set nocompatible               " Be iMproved
endif

let g:dein#install_max_processes = 48
augroup PluginInstall
  autocmd!
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END
command! -nargs=0 PluginUpdate call dein#update()

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_repo_dir

if !isdirectory(s:dein_repo_dir)
  call mkdir(s:dein_repo_dir, 'p')
  silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_repo_dir)
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" indent
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set noexpandtab
function! s:toggle_indent()
  if &tabstop == 2
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal softtabstop=4
  else
    setlocal shiftwidth=2
    setlocal tabstop=2
    setlocal softtabstop=2
  endif
endfunction
nnoremap <silent> <Space>ot :<C-u>call <SID>toggle_indent()<CR>

" keybind
function! s:my_cr_func()
    let presentchar = getline(".")[col(".")-1]
    let prevchar = getline(".")[col(".")-2]
    if presentchar == "}" && prevchar == "{"
        return "\<CR>\<TAB>\<CR>\<UP>\<RIGHT>"
    else
        return "\<CR>"
    endif
endfunction
inoremap <silent> jj <ESC>
imap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><CR> pumvisible() ? neocomplcache#close_popup() : <SID>my_cr_func()
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

