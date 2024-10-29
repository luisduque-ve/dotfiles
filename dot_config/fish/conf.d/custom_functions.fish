function custom_cat
    if test (count $argv) -lt 2
        echo "Usage: custom_cat <file_extension> <recursive_flag>"
        return 1
    end

    set ext $argv[1]
    set recursive $argv[2]

    if test $recursive = "true"
        set find_command "find . -name '*.$ext' -type f"
    else
        set find_command "find . -maxdepth 1 -name '*.$ext' -type f"
    end

    for file in (eval $find_command)
        echo "### $file"
        echo ""
        cat $file
        echo ""
    end
end
