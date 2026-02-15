git_prompt() {
    local format_string="$1"
    local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3-)"
    local branch_truncated="${branch:0:30}"
    if (( ${#branch} > ${#branch_truncated} )); then
        branch="${branch_truncated}..."
    fi
    [ -n "${branch}" ] && printf "$format_string" "$branch"
}
venv_prompt() {
    local format_string="$1"
    local venv="${VIRTUAL_ENV##*/}"
    [ -n "${venv}" ] && printf "$format_string" "$venv"
}
update_prompt() {
    PS1='$(venv_prompt "|\[\033[01;32m\]%s\[\033[00m\]")'
    PS1+='$(git_prompt "|\[\033[01;33m\]%s\[\033[00m\]")'
    PS1+='|\[\033[01;34m\]\W\[\033[00m\]\$ '
}
# Set prompt command to update prompt formatting
# PROMPT_COMMAND="update_prompt; $PROMPT_COMMAND"
PROMPT_COMMAND="update_prompt"

export FZF_DEFAULT_OPTS="--height 100% --layout=reverse --border --inline-info"
export EDITOR=vim
export VISUAL=vim
export PATH=$PATH:/usr/local/go/bin

new_session(){ tmux-sessionizer; }
bind -x '"\C-f":new_session'
bind -x '"\C-l":clear'


