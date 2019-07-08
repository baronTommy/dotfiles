function fzf_z -d "Change directory"
    z -l | cut -c 12- | fzf | read select
    [ -n "$select" ]; and cd "$select"


    commandline -r ''
    commandline -f repaint
    echo

    emit fish_prompt
end
