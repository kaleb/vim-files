if empty($XDG_CACHE_HOME)
	let $XDG_CACHE_HOME = $HOME."/.cache"
endif
if empty($XDG_CONFIG_HOME)
	let $XDG_CONFIG_HOME = $HOME."/.config"
endif
if !isdirectory($XDG_CACHE_HOME  . "/vim/swap")
  call mkdir($XDG_CACHE_HOME . "/vim/swap", "p")
endif
set directory=$XDG_CACHE_HOME/vim/swap//,/var/tmp//,/tmp//


if !isdirectory($XDG_CACHE_HOME  . "/vim/backup")
  call mkdir($XDG_CACHE_HOME . "/vim/backup", "p")
endif
set backupdir=$XDG_CACHE_HOME/vim/backup//,/var/tmp//,/tmp//

" see :help persistent-undo
if !isdirectory($XDG_CACHE_HOME  . "/vim/undo")
  call mkdir($XDG_CACHE_HOME . "/vim/undo", "p")
endif
set undodir=$XDG_CACHE_HOME/vim/undo//,/var/tmp//,/tmp//
set undofile

set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
"viminfo=!,'100,<50,s10,h,n$XDG_CACHE_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,/var/lib/vim/addons,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,/var/lib/vim/addons/after,$XDG_CONFIG_HOME/vim/after
source $XDG_CONFIG_HOME/vim/vimrc
