function __rye_shell_activate --on-variable PWD
    if status --is-command-substitution
        return
    end
    if not test -e "$PWD/requirements.lock"
        if not string match -q "$__rye_fish_initial_pwd"/'*' "$PWD/"
            set -U __rye_fish_final_pwd "$PWD"
            exit
        end
        return
    end

    if not test -n "$VIRTUAL_ENV"
        if rye show >/dev/null 2>&1
        set -x __rye_fish_initial_pwd "$PWD"

        rye shell --no-banner

        set -e __rye_fish_initial_pwd
        if test -n "$__rye_fish_final_pwd"
            cd "$__rye_fish_final_pwd"
            set -e __rye_fish_final_pwd
        end
        end
    end
end

