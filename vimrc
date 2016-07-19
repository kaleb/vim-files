" Author: <http://kaleb.horns.by>

let $MYVIMRC = expand("<sfile>")

runtime bundle/pathogen/autoload/pathogen.vim
if exists("g:loaded_pathogen")
  exec pathogen#infect()
  Helptags
endif

" Options: --------------------------------------------------------------------

set sessionoptions-=options
set tildeop
set splitbelow
set splitright
set backup
set cpoptions+=J          " See: `:h cpo-J`, http://go.horns.by/omkld
set hidden                " Thanks: vim-cast#6 http://go.horns.by/inuif
set background=dark
set wildmode=list:longest " make completion menu behave like shell
set ignorecase
set smartcase             " case-sensitive search when using a capital letter
set modeline              " Debian derivatives disable 'modeline'
set modelines=5
set whichwrap=<,[,h,l,],>

" Columns
set number
set relativenumber
set numberwidth=4
set foldcolumn=4
set colorcolumn=80


if has('mouse')
	set mouse=a
	if !empty($TMUX) && &ttym == "xterm"    " Fix mouse support under tmux
		set ttym=xterm2                 " TODO fix in my tmux settings
	end
end

if &t_Co > 2 || has("gui_running")              " Let there be color
	set hlsearch
end

if has("autocmd")
	aug vimrcEx | au!
		" Jump to the last position when reopening a file.
		au BufReadPost * RestorePosition
	aug END
end

" See: `:h restore-position`, `:h last-position-jump`
command! RestorePosition normal! g`"

" See: my-:DiffOrig
command! DiffOrig call DiffOrig()

func! DiffOrig()
	OpenOrig
	diffthis
	wincmd p
	diffthis
endfunc

" See: :OpenOrig
command! OpenOrig call OpenOrig()

func! OpenOrig()
	vnew
	set buftype=nofile
	read #
	0 delete _
endfunc


" Mappings: --------------------------------------------------------------

let mapleader = "\<Space>"

nnoremap <Leader> <NOP>
nnoremap <Leader>V              :belowright vsplit $MYVIMRC<CR>
nnoremap <Leader>Q              :belowright vertical cwindow<CR>
nnoremap <Leader>L              :belowright vertical lwindow<CR>
nnoremap <Leader>t"             :!tmux split-window -v<CR><CR>
nnoremap <Leader>t%             :!tmux split-window -h<CR><CR>

nnoremap <Leader><Space>        <C-D>
" For my Sidekick 4g which does not have ` or ~ keys
" Android alt+w
noremap            `
noremap!           `
" Android alt+e
noremap            ~
noremap!           ~
"÷

" pi_netrw Settings: ---------------------------------------------------------

let g:netrw_liststyle=3

" syntastic Settings: --------------------------------------------------------

let g:syntastic_auto_loc_list=1

" fugitive settings/abbreviations: -------------------------------------------

cnoreabbrev gst Gst

" calendr Settings: ----------------------------------------------------------

let g:calendar_diary = "~/.calendar"

" Old Settings: to be reviewed
"nmap gx <Plug>NetrwBrowseX
"nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
"set fileencodings=ucs-bom,utf-8,default,latin1
"set printoptions=paper:letter
"set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")
