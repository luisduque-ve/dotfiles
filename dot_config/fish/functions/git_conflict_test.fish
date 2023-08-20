function git_conflict_test
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
