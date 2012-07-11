if exists("did\_load\_filetypes")
 finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.markdown,*.mkd,*.md setf markdown
  au! BufRead,BufNewFile *.go setf golang
augroup END
