" Add or remove your plugins here:
" completion
call dein#add('jiangmiao/auto-pairs')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory= g:dein_dir . '/repos/github.com/Shougo/neosnippet-snippets/neosnippets'

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

" quickrun
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

" unite
call dein#add('Shougo/unite.vim')
call dein#add('ujihisa/unite-colorscheme', {'depends' : 'Shougo/unite.vim'})

" vimproc
"call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
"call dein#add('Shougo/vimshell', {'depends' : 'Shougo/vimproc.vim'})

" comment
call dein#add('tomtom/tcomment_vim')

" indent
call dein#add('nathanaelkane/vim-indent-guides')
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_auto_colors = 0 
let g:indent_guides_guide_size = 1
augroup IndentGuidesColors
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
augroup END

" colorscheme
"call dein#add('w0ng/vim-hybrid')
"call dein#add('tomasr/molokai')
"call dein#add('nanotech/jellybeans.vim')

" others
"call dein#add('modsound/gips-vim.git')
"let g:gips_reading_txt = s:plugin_dir . '/repos/github.com/modsound/gips-vim/autoload/dict/quickref_vim.txt'



" html
call dein#add('mattn/emmet-vim')
call dein#add('mattn/webapi-vim')
call dein#add('tell-k/vim-browsereload-mac')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('taichouchou2/html5.vim')
call dein#add('kchmck/vim-coffee-script')
