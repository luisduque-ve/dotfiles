function custom_cat
    if test (count $argv) -eq 0
        echo "Usage: custom_cat <file_extension>"
        return 1
    end

    set ext $argv[1]

    for file in (find . -name "*.$ext" -type f)
        echo "### $file"
        echo ""
        cat $file
        echo ""
    end
end
