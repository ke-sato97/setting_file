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
" set statusline+=\ %{tabpagenr()}
set fileencodings=utf-8,cp932
set splitright
set number
set hidden


" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge


" キーマップの設定変更
" <Leader>キーをスペースキーに設定
let mapleader = "\<Space>"
" 括弧内にカーソルを合わせる
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap < <><LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
" ESCキーをjkに変更
inoremap jj <ESC>
" Escの2回押しでハイライト消去"
nnoremap <ESC><ESC> :nohlsearch<CR>
" Hで行頭に移動
nnoremap H ^
" Lで行末に移動
nnoremap L $
" Jで画面一番上の行に移動
nnoremap J 10j
" Kで画面一番下の行に移動
nnoremap K 10k
" Uでredoする
nnoremap U <C-r>
" <C-z>で数字を増やす
nnoremap <C-z> <C-a>
" space aで全選択
nnoremap <Leader>a ggVG
" <Space>tで:tabeと入力される
nnoremap <Leader>t :tabe
" <Space>eで:editと入力される
nnoremap <Leader>e :edit
" <Leader>jで前のbuffer
nnoremap <Space>j :bprev<CR>
" <Leader>kで次のbuffer
nnoremap <Space>k :bnext<CR>
" <Leader>oで分割した画面の移動
nnoremap <Leader>o <C-w><C-w>

" Qで強制終了
nnoremap Q :q!<CR>
" :Rで.rbファイルを保存して実行する
command! R w | !ruby %
" :Vでinit.vimファイルを保存して実行する
command! V w | source %
" :vsでvsしつつFZF起動
command! VS vsplit | FZF


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

" <leader>をプレフィックスキーに設定
nnoremap    [Tag]   <Nop>
nmap    <leader> [Tag]
" <leader>1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" <leader>c 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" <leader>x タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" <leader>l 次のタブ
map <silent> [Tag]l :tabnext<CR>
" <leader>h 前のタブ
map <silent> [Tag]h :tabprevious<CR>

" <Leader>oで分割した画面の移動
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
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
call plug#end()


" colorscheme
" ここに置かないと適用されない
set hlsearch
colorscheme material
hi Search ctermbg=Yellow ctermfg=black
hi visual ctermbg=darkgray ctermfg=NONE
hi Pmenu ctermbg=black
hi PmenuSel ctermbg=lightmagenta ctermfg=black
" tabline
hi clear TabLine
hi TabLineFill NONE
hi TabLine ctermbg=NONE ctermfg=white
hi TabLineSel ctermbg=NONE ctermfg=darkred
hi rubySymbol ctermfg=117 guifg=#89ddff
"hi Constant ctermfg=117 guifg=#89ddff
"hi Statement  term=bold ctermfg=11 gui=bold guifg=#ffff60
hi rubyKeyword term=bold ctermfg=11 gui=bold guifg=#ffff60
hi StatusLine  ctermfg=111 ctermbg=NONE guifg=#eeffff guibg=NONE
" rubyfile color
hi Normal ctermfg=white guifg=white
" normal
" hi rubyMethodName term=underline ctermfg=yellow guifg=yellow
" hi rubyMethodName ctermfg=176 guifg=#c792ea
" hi rubyInstanceVariable ctermfg=203 guifg=#ff5370
" hi Comment ctermfg=darkgray guifg=Blue


" UltiSnipsの環境構築
" python3の読み込み
let g:python3_host_prog = '/usr/bin/python3'
" ultisnips の有効化
" Tabでスニペット展開
let g:UltiSnipsExpandTrigger="<tab>"
" Ctrl + lで次のフィールドに移動
let g:UltiSnipsJumpForwardTrigger='<c-l>'
" Ctrl + hで前のフィールドに移動
let g:UltiSnipsJumpBackwardTrigger='<c-h>'
" スニペットの編集する時にウィンドウを縦に分割する
let g:UltiSnipsEditSplit='vertical'
" coc.nvimとの連携
let g:coc_snippet_next = '<C-n>'
let g:coc_snippet_prev = '<C-p>'
" <Leader>sを:UltiSnipsEditコマンドに割り当て
nnoremap <silent> <Leader>s :UltiSnipsEdit<CR>


" <leader>igでindent-blankline.nvimの表示・非表示を切り替える ※最初だけ２回
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

" <leader>eでNERDTreeが起動する
nnoremap <silent><leader>n :NERDTreeToggle<CR>

" fizzy finderの設定
" <leader>fでfizzy finderが起動する
nnoremap  <silent><leader>f :FZF<CR>
