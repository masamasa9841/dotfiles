"---------------------------------------------------------------------------
" vimshell.vim
"

let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_right_prompt = ''
let g:vimshell_prompt = '% '
let g:vimshell_split_command = ''
let g:vimshell_enable_transient_user_prompt = 1
let g:vimshell_force_overwrite_statusline = 1


let s:vimshell_hooks = {}
function! s:vimshell_hooks.chpwd(args, context) abort
  call vimshell#execute((len(split(glob('*'), '\n')) < 100) ?
        \ 'ls' : 'echo "Many files."')
endfunction
