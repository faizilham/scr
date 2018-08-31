_scr_completions()
{
    if [ "${#COMP_WORDS[@]}" != "2" ]; then
        return
    fi

    exist=$(screen -list | egrep '(Attached|Detached)' | awk '{print $1;}' | sed -r 's/[0-9]+\.//')
    COMPREPLY=($(compgen -W "$exist" -- "${COMP_WORDS[1]}"))
}

complete -F _scr_completions scr
