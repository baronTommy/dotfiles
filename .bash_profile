export XDG_CONFIG_HOME=~/.config

export FZF_DEFAULT_OPTS='--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104,info:183,prompt:110,spinner:107,pointer:167,marker:215'
# export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_LEGACY_KEYBINDINGS=0


# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

