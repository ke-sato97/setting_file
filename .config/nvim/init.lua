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
vim.o.statusline = vim.o.statusline .. ' %{tabpagenr()}'
vim.o.fileencodings = 'utf-8,cp932'
vim.o.splitright = true
vim.wo.number = true


-- キーマップの設定変更
vim.g.mapleader = " " -- <Leader>キーをスペースキーに設定

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
vim.api.nvim_set_keymap('n', '<C-a>', '^', { noremap = true })

-- Ctrl + eで行末に移動
vim.api.nvim_set_keymap('n', '<C-e>', '$', { noremap = true })

-- Ctrl + jとCtrl + kで段落の前後に移動
vim.api.nvim_set_keymap('n', '<C-j>', '}', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '{', { noremap = true })

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

-- :Vでinit.luaファイルを保存して実行する
vim.cmd([[command! V w | !source %]])

-- :Rコマンドを追加する
vim.cmd([[command! R w | !ruby %]])


-- Anywhere SID. タブラインの追加オプション
local function SID_PREFIX()
  return vim.fn.matchstr(vim.fn.expand('<sfile>'), '<SNR>\\d\\+_\\zsSID_PREFIX$')
end

-- Set tabline.
local function my_tabline()
  local s = ''
  for i = 1, vim.fn.tabpagenr('$') do
    local bufnrs = vim.fn.tabpagebuflist(i)
    local bufnr = bufnrs[vim.fn.tabpagewinnr(i) - 1]  -- first window, first appears
    local no = i + 1  -- タブ番号を1を加えて表示
    local mod = vim.fn.getbufvar(bufnr, '&modified') == 1 and '!' or ' '  -- 変更マークを正しく表示
    local title = vim.fn.fnamemodify(vim.fn.bufname(bufnr), ':t')
    s = s .. '%' .. i .. 'T'
    s = s .. '%#' .. (i == vim.fn.tabpagenr() and 'TabLineSel' or 'TabLine') .. '#'
    s = s .. no .. ':' .. title
    s = s .. mod
    s = s .. '%#TabLineFill# '
  end
  s = s .. '%#TabLineFill#%T%=%#TabLine#'
  return s
end

vim.o.showtabline = 2  -- 常にタブラインを表示

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
vim.cmd('hi Pmenu ctermbg=black')

-- PmenuSelのハイライト設定
vim.cmd('hi PmenuSel ctermbg=lightmagenta ctermfg=black')

-- タブラインのハイライト設定
vim.cmd('hi clear TabLine')
vim.cmd('hi TabLineFill ctermbg=black')
vim.cmd('hi TabLine ctermbg=NONE ctermfg=white')
vim.cmd('hi TabLineSel ctermbg=NONE ctermfg=darkred')
