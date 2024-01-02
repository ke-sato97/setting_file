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

# mysql
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init --no-rehash -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# カスタムプロンプト関数
function my_custom_prompt {
  local git_branch
  # ブランチ名を取得
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
#
#
# # RPROMPTをカスタマイズする関数
# set_rprompt() {
#     if [[ $? -eq 0 ]]; then
#         RPROMPT='%F{green}OK%f'
#     else
#         RPROMPT='%F{red}NG%f'  # 条件に一致しない場合、RPROMPTを非表示にする
#     fi
# }
#
# # プロンプトの表示前にRPROMPTを設定
# precmd_functions+=(set_rprompt)


# 色を使用出来るようにする
autoload -Uz colors
colors

# lsでカラー表示するための設定
alias ls='gls --color=auto'
# eval "$(gdircolors ~/.dircolors-solarized/dircolors.256dark)"


# 設定ファイル関係
# vimと入力するとNeovimが起動する
alias vim="nvim"

# vimと入力するとNeovimが起動する
# alias vimf="nvim $(fzf)"

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
# tでtmuxを実行する(セッション名をつけて新規セッション開始)
alias t="tmux"

# tsでtmux new -sを実行する(セッション名をつけて新規セッション開始)
alias ts="tmux new -s"

# tlでtmux lsを実行する(セッションの一覧)
alias tl="tmux ls"

# taでtmux aを実行する(直前のセッションに移動)
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

# ...で2つ上のディレクトリに移動
alias ...='cd ../..'

# ....で3つ上のディレクトリに移動
alias ....='cd ../../..'

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


# 移動関係
# cd を打たなくていい
setopt auto_cd

# ~v2で下記のファイルに移動できる
hash -d v2=~/workspace/20956_ke-sato97_runteq_curriculum_normal
alias v2="~v2"

# ~v3で下記のファイルに移動できる
hash -d v3=~/workspace/45601_ke-sato97_basic_rails_basic
alias v3="~v3"

# ~portで下記のファイルに移動できる
hash -d portfolio=~/workspace/portfolio_01/portfolio
alias port="~portfolio"

# ~rakutenで下記のファイルに移動できる
hash -d rakuten_api=~/practice/practice_02/rakuten_api
alias rakuten="~rakuten_api"

# ~rakutenで下記のファイルに移動できる
hash -d js=~/practice/practice_02/javascript_01

# ~settingで下記のファイルに移動できる
hash -d setting_file=~/setting_file
alias setting="~setting_file"

# ~praで下記のファイルに移動できる
hash -d practice_02=~/practice/practice_02
alias pra="~practice_02"


# 補完機能関係
# 補完を有効にする
autoload -U compinit
compinit

# 補完を強力にする
 if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit
 fi


# 設定関係
# emax風のキーバインドを設定
bindkey -e

# コマンドミスを修正
setopt correct

# コマンドラインでも 以降をコメントと見なす
setopt interactive_comments

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# カッコを自動補完
setopt auto_param_keys

# 補完候補をできるだけ詰めて表示する
setopt list_packed

# 補完の選択を楽にする
zstyle ':completion:*' menu select

# 補完に色をつける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# 小文字でも大文字ディレクトリ、ファイルを補完できるようにする
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# 履歴検索関係
# 保存する履歴の件数を10万にする
export SAVEHIST=100000

# すでに存在するヒストリファイルにヒストリを追記
setopt append_history
# ヒストリファイルを複数のzshで共有。ターミナルを複数開く時に有効
setopt share_history
# 過去に実行したことのあるコマンドは記録しない
setopt hist_ignore_all_dups
# 重複するコマンドが保存されるとき、古い方を削除する
setopt hist_save_no_dups

# ^Sを有効にする
stty -ixon

# インクリメンタルサーチ
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

# ビギニングサーチ
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# 入力中の文字を一旦どかす
bindkey '^G' push-line

# C-d によるログアウト入力を防止（百回までは無視する）
set -o ignoreeof
IGNOREEOF=100

alias localhost="open http://localhost:3000/"
alias github="open https://github.com/ke-sato97"
alias notion="open https://www.notion.so/78f0911c98084dddb66af30f5c7e14de"
alias udemy="open https://www.udemy.com/home/my-courses/learning/"

# RUNTEQ関係
alias runteq="open https://school.runteq.jp/v2/job_hunting_steps"
alias rq="open https://school.runteq.jp/v2/questions"
