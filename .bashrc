export XDG_CONFIG_HOME=~/.config

# powerline-go
function _update_ps1() {
    PS1="$(<パス>/powerline-go -error $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
