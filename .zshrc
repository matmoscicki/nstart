# Lines configured by zsh-newuser-install
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:~/bin/:$PYENV_ROOT/bin:~/.rtags/bin
export TERMINAL=urxvt

export ENABLE_CORRECTION="true"
export PATH=$PATH:~/.fzf/bin/
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

alias ls='ls --color=tty'
bindkey -e
export FPATH=$FPATH:~/.zplug/repos/junegunn/fzf/shell/
source ~/.zplug/init.zsh

zplug "lib/key-bindings", from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "junegunn/fzf", use:"shell/*.zsh"
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug 'lib/correction', from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug 'lib/completion', from:oh-my-zsh
zplug "dracula/zsh", as:theme
zplug "lib/clipboard", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "djui/alias-tips"
zplug "marzocchi/zsh-notify"

zplug load # --verbose

zstyle ':notify:*' command-complete-timeout 6
