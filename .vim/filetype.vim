augroup filetypedetect
  autocmd!
  autocmd BufRead,BufNewFile *.rb setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=
  autocmd BufRead,BufNewFile *.php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufRead,BufNewFile *.swift setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufRead,BufNewFile *.c setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufRead,BufNewFile *.cc setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufRead,BufNewFile *.cpp setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufRead,BufNewFile *.ino setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
augroup END
