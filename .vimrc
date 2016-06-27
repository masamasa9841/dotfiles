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

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  let g:neosnippet#enable_snipmate_compatibility = 1
  let g:neosnippet#snippets_directory= s:dein_dir . '/repos/github.com/Shougo/neosnippet-snippets/neosnippets'
  call dein#add('Shougo/neocomplcache.vim')
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplcache.
  let g:neocomplcache_enable_at_startup = 1
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
  " Enable heavy features.
  " Use camel case completion.
  "let g:neocomplcache_enable_camel_case_completion = 1
  " Use underbar completion.
  let g:neocomplcache_enable_underbar_completion = 1
  " Define dictionary.
  let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vim/dict/vimshell_hist.dict',
  \ 'scheme' : $HOME.'/.vim/dict/gosh_completions.dict',
  \ 'objc' : $HOME.'/.vim/dict/objc.dict'
  \}
  " Define keyword.
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
  " For cursor moving in insert mode(Not recommended)
  "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
  "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
  "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
  "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
  " Or set this.
  "let g:neocomplcache_enable_cursor_hold_i = 1
  " Or set this.
  "let g:neocomplcache_enable_insert_char_pre = 1
  " AutoComplPop like behavior.
  "let g:neocomplcache_enable_auto_select = 1
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  " Enable heavy omni completion.
  if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
  endif
  let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

  call dein#add('thinca/vim-quickrun') 
  let g:quickrun_config={
  \ '_' :  {
  \     'runner' : 'vimproc',
  \     'runner/vimproc/updatetime' : 60,
  \     'outputter' : 'error',
  \     'outputter/error/success' : 'buffer',
  \     'outputter/error/error'   : 'quickfix',
  \     'outputter/buffer/split'  : ':rightbelow 8sp',
  \     'outputter/buffer/close_on_empty' : 1,
  \ },
  \ 'markdown' : {
  \     'outputter' : 'browser'
  \ },
  \}
  au FileType qf nnoremap <silent><buffer>q :quit<CR>
  nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
  let g:quickrun_no_default_key_mappings = 1
  nnoremap \r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
  xnoremap \r :<C-U>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>

  call dein#add('nathanaelkane/vim-indent-guides') 
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
  let g:indent_guides_auto_colors = 0
  let g:indent_guides_guide_size = 1
  augroup IndentGuidesColors
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
  augroup END

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
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
nnoremap \r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
xnoremap \r :<C-U>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>

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

