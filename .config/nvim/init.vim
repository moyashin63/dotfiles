"--------------------dein--------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=/Users/yamamurashinji/.cache/dein/repos/github.com/Shougo/dein.vim

" call dein#begin('/Users/yamamurashinji/.cache/dein')

" Let dein manage dein

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  " call dein#add(...) 
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
	call dein#intall()
endif

" Colorscheme
colorscheme NeoSolarized

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" 
set pyxversion=3


"--------------------lightline--------------------
let g:lightline = {
      \ 'component_function': {
	  \ 'colorscheme': 'solarized',
      \   'filename': 'LightLineFileNameWithParentDir'
      \ }
      \ }

function! LightLineFileNameWithParentDir()
    if expand('%:t') ==# ''
        let filename = '[No Name]'
    else
        let dirfiles = split(expand('%:p'), '/')
        if len(dirfiles) < 2
            let filename = dirfiles[0]
        else
            let filename = dirfiles[-2] . '/' . dirfiles[-1]
        endif
    endif
    return filename
endfunction


"--------------------keybind変更--------------------
" jjとkkでnormalモードに移行
inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>

" xとsで消した文字がクリップボードに入るのを無効化
nnoremap x "_x
nnoremap s "_s


"--------------------画面表示--------------------
" 行番号の表示
set number

" ヤンクをクリップボードに
set clipboard=unnamedplus

" 現在の列を強調表示
set cursorline

" 入力中のコマンドをステータスに表示する
set showcmd

" タブ入力を複数の空白入力に置き換える set expandtab 画面上でタブ文字が占める幅
set tabstop=4

" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4

" 改行時に前の行のインデントを継続する
set autoindent

" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent

" smartindent で増減する幅
set shiftwidth=4

" コマンドモードの補完
set wildmenu 

" 背景透明化
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 

" html
" Generate end tag
augroup HTMLANDXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" Edit before generated end tag
autocmd Filetype html inoremap <buffer> </ </<C-x><C-o><ESC>F<i

