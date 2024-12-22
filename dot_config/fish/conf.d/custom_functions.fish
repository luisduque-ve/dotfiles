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


function conflict_generator
    # Create/override the folder
    set folder_name "git-conflict-test"
    if test -d $folder_name
        rm -rf $folder_name
    end

    mkdir $folder_name
    cd $folder_name

    # Init a git repository
    git init

    # Create a file
    echo "Initial content" > dummy.txt
    git add dummy.txt
    git commit -m "Initial commit"

    # Create a new branch
    git branch conflict_branch

    # Modify the file in the master branch
    echo "Content added in master branch" >> dummy.txt
    git commit -am "Modify file in master branch"

    # Switch to the conflict branch and modify the file
    git checkout conflict_branch
    echo "Content added in conflict branch" >> dummy.txt
    git commit -am "Modify file in conflict branch"

    echo "Setup complete. You can now try to merge 'conflict_branch' into 'master' to create a conflict."
    cd ..
end
