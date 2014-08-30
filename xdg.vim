if !isdirectory($XDG_CACHE_HOME  . "/vim")
  call mkdir($XDG_CACHE_HOME . "/vim", "p")
endif
set directory=$XDG_CACHE_HOME/vim,~/,/tmp
set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,/var/lib/vim/addons,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,/var/lib/vim/addons/after,$XDG_CONFIG_HOME/vim/after
source $XDG_CONFIG_HOME/vim/vimrc
