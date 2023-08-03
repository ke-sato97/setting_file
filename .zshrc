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

    PROMPT="%n %F{cyan}%c ${git_branch}%F{white} %# "
  else
    # Gitで管理されていない場合は何も表示しない
    PROMPT="%n %F{magenta}%c %F{white}%# "
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


# 設定ファイル関係
# vimと入力するとNeovimが起動する
alias vim="nvim"

# initvimでneovimの設定ファイルを開く
alias initvim="nvim ~/.config/nvim/init.vim"

# vimrcでvimの設定ファイルを開く
alias vimrc="vi ~/.vimrc"

# vxでtmuxの設定ファイルを開く
alias vx="vim ~/.tmux.conf"

# vzでZshの設定ファイルを開く
alias vz="vim ~/.zshrc"

# szでZshファイルを実行する
alias sz="source ~/.zshrc"


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
# rsで"bin/rails server"を実行する
alias rs="bin/rails server"

# rcで"bin/rails console"を実行する
alias rc="bin/rails console"

# rでbin/railsを補完する
alias r="bin/rails"

# rrでbin/rails routesを補完する
alias rr="bin/rails routes"

# rmigrateでbin/rails db:migrateを補完する
alias rmigrate="bin/rails db:migrate"

# rstatusでbin/rails db:migrate:statusを補完する
alias rstatus="bin/rails db:migrate:status"

# rmigrateresetでbin/rails db:migrate:resetを補完する
alias rmigratereset="bin/rails db:migrate:reset"

# rresetでbin/rails db:resetを補完する
alias rreset="bin/rails db:reset"

# rbackでbin/rails db:rollbackを補完する
alias rback="bin/rails db:rollback"

# rcreateでbin/rails db:createを補完する
alias rcreate="bin/rails db:create"

# rdropでbin/rails db:dropを補完する
alias rdrop="bin/rails db:drop"

# bvでbundle execを補完する
alias be="bundle exec"

# bでbundle installを補完する
alias b="bundle install"

# bvでbin/devを補完する(rails7以降)
alias bv="bin/dev"


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

