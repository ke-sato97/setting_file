syntax on
set shell=/bin/zsh
set shiftwidth=2
set tabstop=2
set expandtab
set smartindent
set textwidth=0
set autoindent
set clipboard=unnamed
set laststatus=0
set wildmenu
set noswapfile
set statusline+=\ %{tabpagenr()}
set fileencodings=utf-8,cp932
set wildmenu
" set number

" スペースキーに変更
let mapleader = "\<Space>"

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" キーマップの設定変更
" 括弧内にカーソルを合わせる
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>
" ESCキーをjkに変更
inoremap jk <ESC>
" Escの2回押しでハイライト消去"
nnoremap <ESC><ESC> :nohlsearch<CR>
" Ctrl + aで行頭に移動
nnoremap <C-a> ^
" Ctrl + eで行末に移動
nnoremap <C-e> $
" Ctrl + j と Ctrl + k で 段落の前後に移動
nnoremap <C-j> }
nnoremap <C-k> {
" Jで画面一番上の行に移動
nnoremap J 10j
" Kで画面一番下の行に移動
nnoremap K 10k
" <C-z>で数字を増やす
nnoremap <C-z> <C-a>
" space aで全選択
nnoremap <Leader>a ggVG
" <Space>tで:tabeと入力される
nnoremap <Leader>t :tabe
" <Space>eで:editと入力される
nnoremap <Leader>e :edit

" :Rでrubyファイルを保存して実行する
command! R w | !ruby %

" :Vでinit.vimファイルを保存して実行する
command! V w | !source %

" タブの表示及び移動の設定
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" タブラインの表示設定
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

" tをプレフィックスキーに設定
nnoremap    [Tag]   <Nop>
nmap    <leader> [Tag]
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tl 次のタブ
map <silent> [Tag]l :tabnext<CR>
" th 前のタブ
map <silent> [Tag]h :tabprevious<CR>

nnoremap <Leader>o <C-w><C-w>


" vim-plugでプラグイン管理
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-jp/vimdoc-ja'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-endwise'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
call plug#end()


" colorscheme
" ここに置かないと適用されない
set hlsearch
colorscheme material
hi Search ctermbg=lightcyan ctermfg=black
hi visual ctermbg=lightcyan ctermfg=NONE
hi Pmenu ctermbg=black
hi PmenuSel ctermbg=lightmagenta ctermfg=black
" tabline
hi clear TabLine
hi TabLineFill ctermbg=NONE
hi TabLine ctermbg=NONE ctermfg=white
hi TabLineSel ctermbg=NONE ctermfg=darkred


" UltiSnipsの環境構築
" python3の読み込み
let g:python3_host_prog = '/usr/bin/python3'
" ultisnips の有効化
" Tabでスニペット展開
let g:UltiSnipsExpandTrigger="<tab>"
" tabを押すと次のフィールドに移動
let g:UltiSnipsJumpForwardTrigger='<c-l>'
" Shift + Tabで前のフィールドに移動
let g:UltiSnipsJumpBackwardTrigger='<c-h>'
" スニペットの編集する時にウィンドウを縦に分割する
let g:UltiSnipsEditSplit='vertical'
" coc.nvimとの連携
let g:coc_snippet_next = '<C-n>'
let g:coc_snippet_prev = '<C-p>'
" <Leader>sを:UltiSnipsEditコマンドに割り当て
nnoremap <silent> <Leader>s :UltiSnipsEdit<CR>

" coc.nvimの設定変更
" imap <silent> <C-s> <Plug>(coc-snippets-expand)
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" <leader>igでindent-blankline.nvimの表示・非表示を切り替える
let g:indent_blankline_enabled = 1

function! ToggleIndentBlankline()
    if g:indent_blankline_enabled == 1
        let g:indent_blankline_enabled = 0
        IndentBlanklineDisable
    else
        let g:indent_blankline_enabled = 1
        IndentBlanklineEnable
    endif
endfunction

nnoremap <leader>ig :call ToggleIndentBlankline()<CR>


" NERDTreeの設定
" ファイル指定なしでvimを立ち上げた時にNERDTreeが起動する。
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Ctrl+eでNERDTreeが起動する
nnoremap <silent><C-n> :NERDTreeToggle<CR>
