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
# eval "$(gdircolors ~/.dircolors-solarized/dircolors.256dark)"


# 設定ファイル関係
# vimと入力するとNeovimが起動する
alias vim="nvim"

# vntでneovimの設定ファイルを開く
alias viminit="nvim ~/.config/nvim/init.vim"

# vrcでvimの設定ファイルを開く
alias vimrc="vi ~/.vimrc"

# vtmでtmuxの設定ファイルを開く
alias vimtmux="vim ~/.tmux.conf"

# vzでZshの設定ファイルを開く
alias vz="vim ~/.zshrc"

# szでZshファイルを実行する
alias sz="source ~/.zshrc"


# ターミナル操作関係
# llで詳細情報を表示
alias ll="ls -l"

# laで隠しファイル含めた詳細情報を表示
alias la="ls -la"

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
