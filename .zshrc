export CLICOLOR=1
export LS_COLORS="di=01;36:*.py=32:*.c=34:*.h=94:*.cpp=34:*.zip=31"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# disable the default virtualenv prompt change
# export VIRTUAL_ENV_DISABLE_PROMPT=1
setopt PROMPT_SUBST
PROMPT='%{%F{3}%}%9c%{%B%F{magenta}%}$(parse_git_branch)%b %{%F{14}%}λ %{%F{none}%}'
export TERM=xterm-256color
export PATH=/opt/homebrew/bin:$PATH
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/Users/alexchen/Library/Python/3.8/bin:$PATH"
export PATH="/Users/alexchen/.pyenv/versions/3.8.4/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/alexchen/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/alexchen/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/alexchen/opt/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/alexchen/opt/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

