vim.cmd('syntax enable')
vim.o.shell = '/bin/zsh'
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.textwidth = 0
vim.o.autoindent = true
vim.o.clipboard = 'unnamed'
vim.o.laststatus = 0
vim.o.wildmenu = true
vim.o.swapfile = false
vim.o.fileencodings = 'utf-8,cp932'
vim.o.splitright = true
vim.o.number = true
vim.o.showtabline = 2


-- キーマップ
-- <Leader>キーをスペースキーに設定
vim.g.mapleader = " "
-- 括弧内にカーソルを合わせる
vim.api.nvim_set_keymap('i', '{', '{}<LEFT>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<LEFT>', { noremap = true })
vim.api.nvim_set_keymap('i', '(', '()<LEFT>', { noremap = true })
vim.api.nvim_set_keymap('i', '"', '""<LEFT>', { noremap = true })
vim.api.nvim_set_keymap('i', "'", "''<LEFT>", { noremap = true })
vim.api.nvim_set_keymap('i', '<', '<><LEFT>', { noremap = true })
-- Escキーをjkに変更
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })
-- Ctrl + aで行頭に移動
vim.api.nvim_set_keymap('n', 'H', '^', { noremap = true })
-- Ctrl + eで行末に移動
vim.api.nvim_set_keymap('n', 'L', '$', { noremap = true })
-- <Leader>jで前のbuffer
vim.api.nvim_set_keymap('n', '<Space>j', ':bprev<CR>', { noremap = true, silent = true })
-- <Leader>kで次のbuffer
vim.api.nvim_set_keymap('n', '<Space>k', ':bnext<CR>', { noremap = true, silent = true })
-- Jで画面一番上の行に移動
vim.api.nvim_set_keymap('n', 'J', '10j', { noremap = true })
-- Kで画面一番下の行に移動
vim.api.nvim_set_keymap('n', 'K', '10k', { noremap = true })
-- Ctrl + zで数字を増やす
vim.api.nvim_set_keymap('n', '<C-z>', '<C-a>', { noremap = true })
-- space aで全選択
vim.api.nvim_set_keymap('n', '<Leader>a', 'ggVG', { noremap = true })
-- <Space>tで:tabeと入力される
vim.api.nvim_set_keymap('n', '<Leader>t', ':tabe', { noremap = true })
-- <Space>eで:editと入力される
vim.api.nvim_set_keymap('n', '<Leader>e', ':edit', { noremap = true })
-- Ctrl + eで行末に移動
vim.api.nvim_set_keymap('n', 'Q', ':q!<CR>', { noremap = true })
-- :Vでinit.luaファイルを保存して実行する
vim.cmd([[command! V w | source %]])
-- :Rコマンドを追加する
vim.cmd([[command! R w | !ruby %]])
-- <leader>をプレフィックスキーに設定
vim.api.nvim_set_keymap('n', '[Tag]', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>', '[Tag]', { noremap = true })

-- <leader>1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n = 1, 9 do
    vim.api.nvim_set_keymap('n', string.format('<Leader>%d', n), string.format(':tabnext %d<CR>', n), { noremap = true, silent = true })
end
-- <leader>c 新しいタブを一番右に作る
vim.api.nvim_set_keymap('n', '<Leader>c', ':tablast <bar> tabnew<CR>', { noremap = true, silent = true })
-- <leader>x タブを閉じる
vim.api.nvim_set_keymap('n', '<Leader>x', ':tabclose<CR>', { noremap = true, silent = true })
-- <leader>l 次のタブ
vim.api.nvim_set_keymap('n', '<Leader>l', ':tabnext<CR>', { noremap = true, silent = true })
-- <leader>h 前のタブ
vim.api.nvim_set_keymap('n', '<Leader>h', ':tabprevious<CR>', { noremap = true, silent = true })
-- <Leader>oで分割した画面の移動
vim.api.nvim_set_keymap('n', '<Leader>o', '<C-w><C-w>', { noremap = true, silent = true })


-- hlsearchを有効にする
vim.o.hlsearch = true
-- 検索結果のハイライト設定
vim.cmd('hi Search ctermbg=yellow ctermfg=black')
-- ビジュアルモードのハイライト設定
vim.cmd('hi visual ctermbg=darkgray ctermfg=NONE')
-- Pmenuのハイライト設定
vim.cmd('hi Pmenu ctermbg=darkgray ctermfg=white')
vim.cmd('hi PmenuSel ctermbg=lightmagenta ctermfg=black')
-- タブラインのハイライト設定
vim.cmd('hi clear TabLine')
vim.cmd('hi TabLineFill NONE')
vim.cmd('hi TabLine ctermbg=NONE ctermfg=white')
vim.cmd('hi TabLineSel ctermfg=yellow ctermbg=NONE gui=NONE')
-- ステータスライン設定
vim.cmd('hi StatusLine ctermfg=NONE ctermbg=red guifg=#eeffff guibg=NONE')

--エディタのハイライト
vim.cmd('hi MatchParen ctermbg=8 ctermfg=gray')
-- ruby設定
vim.cmd('hi Normal ctermfg=white guifg=white')
vim.cmd('hi rubyMethodName ctermfg=176 guifg=#c792ea')
vim.cmd('hi Comment ctermfg=darkgray guifg=Blue')
vim.cmd('hi rubyInstanceVariable ctermfg=203 guifg=#ff5370')
-- vim.cmd('hi Constant ctermfg=81 guifg=#ff80ff')
vim.cmd('hi Type ctermfg=yellow guifg=#ff80ff')
vim.cmd('hi LineNr ctermfg=145 guifg=#37474f ')
vim.cmd('hi Statement ctermfg=176 gui=bold')
vim.cmd('hi String ctermfg=47 gui=bold')
vim.cmd('hi rubyKeyword term=bold ctermfg=11 gui=bold guifg=#ffff60')
vim.cmd('hi rubySymbol ctermfg=117 guifg=#89ddff')
vim.cmd('hi htmlTag ctermfg=117 guifg=#89ddff')
vim.cmd('hi htmlTagName ctermfg=204 guifg=#f07178')
