" Author: <http://kaleb.horns.by>

let $MYVIMRC = expand("<sfile>")

runtime bundle/pathogen/autoload/pathogen.vim
if exists("g:loaded_pathogen")
  exec pathogen#infect()
  Helptags
endif

" Options --------------------------------------------------------------------
" Statusline

set ssop-=options
set tildeop
set splitbelow
set splitright
set backup
set cpoptions+=J		" See: `:h cpo-J`, http://go.horns.by/omkld
set hidden			" Thanks: vim-cast#6 http://go.horns.by/inuif


if has('mouse')
	set mouse=a
        if !empty($TMUX) && &ttym == "xterm"	" Fix mouse support under tmux
		set ttym=xterm2			" TODO fix in my tmux settings
	end
end

if &t_Co > 2 || has("gui_running")		" Let there be color
	set hlsearch
end

if has("autocmd")
	aug vimrcEx | au!
		" Jump to the last position when reopening a file.
		au BufReadPost * RestorePosition
	aug END
end

" See: `:h restore-position`, `:h last-position-jump`
command! RestorePosition if line("'\"") > 1 && line("'\"") <= line("$") |
\	exe "normal! g`\"" |
\ end

" See: `:h diff-original-file`
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	\ | wincmd p | diffthis

" Mappings: --------------------------------------------------------------

let maplocalleader = " "

nnoremap <Leader>V		:belowright vsplit $MYVIMRC<CR>
nnoremap <Leader>Q		:belowright vertical cwindow<CR>
nnoremap <Leader>L		:belowright vertical lwindow<CR>

nnoremap <LocalLeader><Space>	<C-D>
" For my Sidekick 4g which does not have ` or ~ keys
" Android alt+w
noremap            `
noremap!           `
" Android alt+e
noremap            ~
noremap!           ~
"÷

" Old Settings: to be reviewed
"nmap gx <Plug>NetrwBrowseX
"nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
"set fileencodings=ucs-bom,utf-8,default,latin1
"set printoptions=paper:letter
"set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")
