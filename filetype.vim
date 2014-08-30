"See :help new-filetype §C
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect

au! BufRead,BufNewFile *.markdown,*.mkd,*.md setf markdown
au! BufRead,BufNewFile *.go setf golang

au! BufNewFile,BufRead *.git/modules/*/COMMIT_EDITMSG setf gitcommit
au! BufNewFile,BufRead $XDG_CONFIG_HOME/git/config setf gitconfig

augroup END
