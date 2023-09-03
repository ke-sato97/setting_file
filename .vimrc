set shell=/bin/zsh
set shiftwidth=2
set tabstop=2
set expandtab
set smartindent
set textwidth=0
set autoindent
set clipboard=unnamed
set number
set laststatus=0
set wildmenu
set noswapfile
set splitright
let mapleader = "\<Space>"

" 保存時に行末の空白を除去する
" autocmd BufWritePre * :%s/\s\+$//ge
" 日本語入力をリセット
" autocmd BufNewFile,BufRead * set iminsert=0"

" 括弧内にカーソルを合わせる
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>
" ESCキーをjjに変更
inoremap jj <ESC>
" Escの2回押しでハイライト消去"
nnoremap <ESC><ESC> :nohlsearch<CR>
" Ctrl + aで行頭に移動
nnoremap <C-a> ^
" Ctrl + eで行末に移動
nnoremap <C-e> $
" space aで全選択
" Jで10行下に移動
nnoremap J 10j
" Kで10行下に移動
nnoremap K 10k
" <C-z>で数字を増やす
nnoremap <C-z> <C-a>
" space aで全選択
nnoremap <Leader>a ggVG
" :tで:tabeと入力される
nnoremap <Leader>t :tabe
" :eで:editと入力される
nnoremap <Leader>e :edit
" <Leader>jで前のbuffer
nnoremap <Space>j :bprev<CR>
" <Leader>kで次のbuffer
nnoremap <Space>k :bnext<CR>
" <Leader>oで分割した画面の移動
nnoremap <Leader>o <C-w><C-w>
nnoremap vs :vsplit<CR>
" Qで強制終了
nnoremap Q :q!<CR>
" vvでビジュアル矩形モード
vnoremap v <C-v>

" :rで.rbファイルを保存して実行する
command! R w | !ruby %
cnoremap r :R
" :vでinit.vimファイルを保存して実行する
command! V w | source %
cnoremap v :V

syntax on
set hlsearch
set background=dark
hi Search ctermbg=lightcyan ctermfg=black
hi visual ctermbg=darkgray ctermfg=NONE
hi Pmenu ctermbg=black ctermfg=white
hi PmenuSel ctermbg=lightmagenta ctermfg=black

" tabline
hi clear TabLine
hi TabLineFill term=NONE cterm=NONE ctermfg=231 gui=NONE guifg=#eeffff guibg=#2c3b41
hi TabLine ctermbg=NONE ctermfg=white
hi TabLineSel ctermbg=NONE ctermfg=203

" rubyfile color
hi Normal ctermfg=white guifg=white
"hi rubyMethodName term=underline ctermfg=yellow guifg=yellow
hi rubyMethodName ctermfg=176 guifg=#c792ea
hi rubyInstanceVariable ctermfg=203 guifg=#ff5370
hi Comment ctermfg=darkgray guifg=Blue


" Anywhere SID. タブラインの追加オプション
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]l :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]h :tabprevious<CR>
" tp 前のタブ

function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" ファイル指定なしでvimを立ち上げた時にNERDTreeが起動する。
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Ctrl+eでNERDTreeが起動する
nnoremap <silent><C-n> :NERDTreeToggle<CR>

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-jp/vimdoc-ja'
call plug#end()

syntax enable
set background=dark
""colorscheme solarized
