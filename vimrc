" Author: <http://kaleb.horns.by>

runtime bundle/pathogen/autoload/pathogen.vim | call pathogen#infect()
Helptags
let $MYVIMRC = expand("<sfile>")

set nocp ru sc is ls=2 hi=50 bs=indent,eol,start ssop-=options top

" see: ":help cpo-J", and http://stevelosh.com/blog/2012/10/why-i-two-space/
set cpo+=J

if has('mouse') | set mouse=a | endif
if &t_Co > 2 || has("gui_running") | sy on | set hls | endif

if has("vms") | set nobk | else | set bk | endif

if &sh =~ 'fish' | set sh=/bin/bash | endif

if has("autocmd")
	filet plugin indent on
	aug vimrcEx | au!
		" Jump to the last position when reopening a file.
		au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" | endif
	aug END
else
	set ai
endif
" Diff Original File: see the diff between current buff & original file
if !exists(":DiffOrig")
	com DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	\ | wincmd p | diffthis
endif
" Mappings: --------------------------------------------------------------

" <Space> as half-page down
nnoremap <Space>    <C-D>
" Next and previous tab
nnoremap <C-Tab>    gt
nnoremap <S-C-Tab>  gT
" For my Sidekick 4g which does not have ` or ~ keys
" Android alt+w
noremap            `
noremap!           `
" Android alt+e
noremap            ~
noremap!           ~
"÷

" Exercises: -------------------------------------------------------------
nnoremap <Leader>j  ddp
nnoremap <Leader>k  ddkP
nnoremap <Leader>ev :vs $MYVIMRC<CR>

" Old Settings: to be reviewed
"version 6.0
"if &cp | set nocp | endif
"let s:cpo_save=&cpo
"set cpo&vim
"nmap \caL <Plug>CalendarH
"nmap \cal <Plug>CalendarV
"nmap gx <Plug>NetrwBrowseX
"nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
"nmap <silent> <Plug>CalendarH :cal Calendar(1)
"nmap <silent> <Plug>CalendarV :cal Calendar(0)
"let &cpo=s:cpo_save
"unlet s:cpo_save
"set fileencodings=ucs-bom,utf-8,default,latin1
"set helplang=en
"set nomodeline
"set printoptions=paper:letter
"set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim72,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
"set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
"set showcmd
"" vim: set ft=vim :
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
"map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
"inoremap <C-U> <C-G>u<C-U>
"

" vim:fdm=marker
