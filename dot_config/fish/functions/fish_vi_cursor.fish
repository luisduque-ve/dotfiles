function fish_vi_cursor --on-variable fish_bind_mode
    switch $fish_bind_mode
        case insert
            printf "\e[6 q"  # Steady line cursor for insert mode
        case command
            printf "\e[2 q"  # Block cursor for command mode
        case default
            printf "\e[2 q"  # Block cursor for other modes
    end
end
