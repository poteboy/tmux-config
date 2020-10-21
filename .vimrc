filetype plugin indent on

" 色つけたり
syntax on

" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect

" タブでスペース４つ分
set tabstop=4

" 行番号を表示
set number

" 入力中のコマンドをステータスに表示する
set showcmd

" 現在の行を強調表示
set cursorline

" タブ
set expandtab

" インデントはスマートインデント
set smartindent

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

" 検索語をハイライト表示
set hlsearch

set nocompatible
filetype off

" nerdtree
execute pathogen#infect()

" 隠しファイルをデフォルトで表示
let NERDTreeShowHidden = 1
"キーマップ。（ctrl+nで起動できるように）
map <C-n> :NERDTreeToggle<CR>

"  leaderキーを,にする
let mapleader = ","

" ファイルの定義元に飛ぶ
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

"----------------------------------------------------------
" NeoBundle
"----------------------------------------------------------
if has('vim_starting')
    " 初回起動時のみruntimepathにNeoBundleのパスを指定する
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    " NeoBundleが未インストールであればgit cloneする
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするVimプラグインを以下に記述
" NeoBundle自身を管理
NeoBundleFetch 'Shougo/neobundle.vim'
" 色付き
NeoBundle 'scrooloose/syntastic'
" ファイル名検索
NeoBundle "ctrlpvim/ctrlp.vim"

" シンタックとかインデント
NeoBundle "sheerun/vim-polyglot"


"============================="
  " こんな感じでプラグインを記述
  " NeoBundle 'tpope/vim-fugitive'
"============================="

call neobundle#end()

" 未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck



" copy current file name (relative/absolute) to system clipboard
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <leader>cf :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>cF :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <leader>ct :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>ch :let @*=expand("%:p:h")<CR>
endif

" copy current file name (relative/absolute) to system clipboard (Linux version)
if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
  " relative path (src/foo.txt)
  nnoremap <leader>cf :let @+=expand("%")<CR>

  " absolute path (/something/src/foo.txt)
  nnoremap <leader>cF :let @+=expand("%:p")<CR>

  " filename (foo.txt)
  nnoremap <leader>ct :let @+=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>ch :let @+=expand("%:p:h")<CR>
endif
