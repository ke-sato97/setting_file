export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
eval "$(rbenv init -)"
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
eval "$(nodenv init -)"
export PATH=/opt/homebrew/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
eval "$(pyenv init -)"
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'


# カスタムプロンプト関数
function my_custom_prompt {
  local git_branch
  git_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

  if [[ $? -eq 0 ]]; then
    # Gitで管理されている場合
    git_status=$(git status --porcelain 2>/dev/null)
    if [[ -z "$git_status" ]]; then
      # クリーンな状態
      git_branch="%F{green}${git_branch}"
    else
      # 変更がある状態
      git_branch="%F{yellow}${git_branch}"
    fi

    PROMPT="%n %F{117}%c ${git_branch} %F{white}%# "
  else
    # Gitで管理されていない場合は何も表示しない
    PROMPT="%n %F{117}%c %F{white}%# "
  fi
}

precmd() {
  my_custom_prompt
}


# 色を使用出来るようにする
autoload -Uz colors
colors

# lsでカラー表示するための設定
alias ls='gls --color=auto'
# eval "$(gdircolors ~/.dircolors-solarized/dircolors.256dark)"


# 設定ファイル関係
# vimと入力するとNeovimが起動する
alias vim="nvim"

# initvimでneovimの設定ファイルを開く
alias initvim="nvim ~/.config/nvim/init.vim"

# initluaでneovimのluaファイルを開く
alias initlua="nvim ~/.config/nvim/init.lua"

# vimrcでvimの設定ファイルを開く
alias vimrc="vi ~/.vimrc"

# vtでtmuxの設定ファイルを開く
alias vt="vim ~/.tmux.conf"

# vzでZshの設定ファイルを開く
alias vz="vim ~/.zshrc"

# szでZshファイルを実行する
alias sz="source ~/.zshrc"


# tmux関係
# tnsでtmux new -sを実行する(セッション名をつけて新規セッション開始)
alias tns="tmux new -s"

# tlでtmux lsを実行する(セッションの一覧)
alias tl="tmux ls"

# taでtmux aを実行する(セッションの移動)
alias ta="tmux a"

# tatでtmux a -tを実行する(指定のセッションに移動)
alias tat="tmux a -t"

# tkでtmux kill-session -tを実行する(指定のセッションを終了する)
alias tk="tmux kill-session -t"

# tkstでtmux kill-session -tを実行する(tmux全体を終了する)
alias tks="tmux kill-server"


# ターミナル操作関係
# llで詳細情報を表示
alias ll="ls -l"

# laで隠しファイル含めた詳細情報を表示
alias la="ls -la"

# mkdirで必要に応じて親ファイルも作成
alias mkdir="mkdir -p"

# ..で1つ上のディレクトリに移動
alias ..="cd .."

# :qで終了
alias :q="exit"


# rails関係のalias
# rでbin/railsを補完する
alias r="bin/rails"

# rsで"bin/rails server"を実行する
alias rs="bin/rails server"

# rcで"bin/rails console"を実行する
alias rc="bin/rails console"

# rgmでbin/rails g modelを補完する
alias rgm="bin/rails g model"

# rgcでbin/rails g controllerを補完する
alias rgc="bin/rails g controller"

# rdmでbin/rails d modelを補完する
alias rdm="bin/rails d model"

# rdcでbin/rails d controllerを補完する
alias rdc="bin/rails d controller"

# beでbundle execを補完する
alias be="bundle exec"

# berでbundle exec rspecを補完する
alias ber="bundle exec rspec"

# bでbundle installを補完する
alias b="bundle install"

# bvでbin/devを補完する(rails7以降)
alias bv="bin/dev"

# rrでbin/rails routesを補完する(ルーティングの確認)
alias rr="bin/rails routes"

# rrgでbin/rails routes -gを補完する(指定したルーティングを確認)
alias rrg="bin/rails routes -g"

# rrcでbin/rails routes -cを補完する(指定したルーティングを確認)
alias rrc="bin/rails routes -c"

# rregでbin/rails routes --expanded -gを補完する(指定したルーティングの詳細を確認)
alias rreg="bin/rails routes --expanded -g"

# rrecでbin/rails routes --expanded -cを補完する(指定したルーティングの詳細を確認)
alias rrec="bin/rails routes --expanded -c"

# rdmでbin/rails db:migrateを補完する(マイグレーションを実行)
alias rdm="bin/rails db:migrate"

# rdbでbin/rails db:rollbackを補完する(1番最後のマイグレーションを未実行にする)
alias rdb="bin/rails db:rollback"

# rdmsでbin/rails db:migrate:statusを補完する(実行中のマイグレーションを確認)
alias rdms="bin/rails db:migrate:status"

# rdmrでbin/rails db:migrate:resetを補完する(マイグレーションをリセットし再実行)
alias rdmr="bin/rails db:migrate:reset"

# rdrでbin/rails db:resetを補完する(データベースをリセットし再実行)
alias rdr="bin/rails db:reset"

# rdcでbin/rails db:createを補完する(データベースを作成する)
alias rdc="bin/rails db:create"

# rddでbin/rails db:dropを補完する(データベースを削除する)
alias rdd="bin/rails db:drop"


# 移動系エイリアス
# ~/rでrails基礎に移動
alias ~/n="cd ~/workspace/20956_ke-sato97_runteq_curriculum_normal"

# ~/pでportfolioに移動
alias ~/p="cd ~/workspace/portfolio_01/portfolio"

# テストアプリ系
alias ~/2="cd ~/practice/practice_02"
alias ~/r="cd ~/practice/practice_02/rakuten_api"
alias ~/j="cd ~/practice/practice_02/stimulus_autocomplete_importmap"

# 補完機能関係
# 補完を強力にする
 if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit
 fi

# コマンドミスを修正
setopt correct

# 補完の選択を楽にする
zstyle ':completion:*' menu select

# 補完候補をできるだけ詰めて表示する
setopt list_packed


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
