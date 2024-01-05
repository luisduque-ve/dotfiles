function n -d "opens a file with nvim after a fzf file search"
    fzf | xargs nvim
end
