"See :help new-filetype §C
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect

au! BufRead,BufNewFile *.markdown,*.mkd,*.md setf markdown
au! BufRead,BufNewFile *.go setf golang

augroup END
