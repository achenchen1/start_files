export CLICOLOR=1
export LS_COLORS="di=01;36:*.py=32:*.c=32:*.h=92:*.cpp=32:*.zip=31:*.csv=34"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# disable the default virtualenv prompt change
# export VIRTUAL_ENV_DISABLE_PROMPT=1
setopt PROMPT_SUBST
PROMPT='%{%F{3}%}%9c%{%B%F{magenta}%}$(parse_git_branch)%b %{%F{14}%}$ %{%F{none}%}'

# So we delete/like/this -> delete/like
# instead of delete/like/this -> <null>
autoload -U select-word-style
select-word-style bash

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH" && export PATH="$HOME/.local/bin:$PATH"
eval "$(pyenv init -)"

__git_files () {
    _wanted files expl 'local files' _files
}

alias chime='(afplay -v 4 /Users/alexchen/Documents/done.m4a &)'
alias gsu="git stash --include-untracked"
alias spiffy="nowplaying-cli get title artist"
alias tagme="ctags -R --languages=Python --fields=+l ."
alias ncc="nowplaying-cli"
alias gpp="git fetch origin master && git checkout -B master origin/master"
alias ls="gls --color"
