function fish_prompt
    # Colors
    set fg_dir_name (printf "\033[1;38;2;66;123;88m") # Bold color #427b58
    set fg_git_branch (printf "\033[1;38;2;143;63;113m") # Bold color #8f3f71
    set fg_venv (printf "\033[1;38;2;7;102;120m") # Bold color #076678
    set fg_prefix (printf "\033[1;38;2;80;73;69m") # Bold color #504945
    set fg_arrow (printf "\033[1;38;2;121;116;14m") # Bold color #79740e
    set reset_color (printf "\033[0m")

    # Display the current directory name or ~ if in home directory
    if test (pwd) = $HOME
        set current_dir "~"
    else
        set current_dir (basename (pwd))
    end
    printf "%s%s%s" $fg_dir_name $current_dir $reset_color

    # Display the git branch if inside a git repository
    set git_branch (command git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if test -n "$git_branch" -a "$git_branch" != "HEAD"
        # Unicode character before git branch name
        set unicode_char ''
        printf " %s%s%s %s %s%s" $fg_prefix "on" $fg_git_branch $unicode_char $git_branch $reset_color
    end

    # Display the Python virtual environment if it is activated, and move it to the rightmost side
    if set -q VIRTUAL_ENV
        set venv_name (basename $VIRTUAL_ENV)
        printf " %s%s%s %s%s" $fg_prefix "via" $reset_color $fg_venv $venv_name $reset_color
    end

    # Newline and arrow sign
    printf "\n%s➜ %s" $fg_arrow $reset_color
end
