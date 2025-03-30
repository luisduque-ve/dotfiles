# For plugins install fisher first
# https://github.com/jorgebucaran/fisher?tab=readme-ov-file#installation
#
# Then this are the current plugins I use
# https://github.com/PatrickF1/fzf.fish?tab=readme-ov-file#installation

source $HOME/.config/fish/custom_variables.fish

if status is-interactive
end

# Remove shell greeting
set -g fish_greeting

# vi mode
set -g fish_key_bindings fish_vi_key_bindings
bind -M insert \cf forward-word
bind -M insert \cp up-or-search
bind -M insert \cn down-or-search

# fzf alias
alias fzf="fzf -m --query \"'\""

# abbreviations
abbr --add ls "eza -l -h"
abbr --add ca "chezmoi apply -v"
abbr --add cu "chezmoi update -v"
abbr --add t "terraform"
abbr --add k "kubectl"
abbr --add gd "git diff --ignore-all-space"
abbr --add ask "aider --no-auto-commits --chat-mode ask --model"
abbr --add bclean "brew bundle --force cleanup"
abbr --add bupgrade "brew bundle install --upgrade"

### Variables

fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.local/share/bob/nvim-bin"
fish_add_path "/opt/homebrew/bin" "/opt/homebrew/sbin"
fish_add_path "/opt/homebrew/bin"
fish_add_path "/opt/homebrew/sbin"

set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx PYDEVD_DISABLE_FILE_VALIDATION 1

### Functions

# I like to use zoxide like this more than just the vanilla z

function a
  set query $argv[1]
  if test -n "$query"
    set selected_dir (zoxide query -l | grep -i "$query" | fzf)
  else
    set selected_dir (zoxide query -l | fzf)
  end
  cd $selected_dir
end

function A
  set query $argv[1]
  if test -n "$query"
    set selected_dir (zoxide query -l | grep -i "$query" | fzf)
  else
    set selected_dir (zoxide query -l | fzf)
  end
  if test -n "$selected_dir"
    zoxide remove $selected_dir
    echo "Removed $selected_dir from zoxide history."
  else
    echo "No directory selected."
  end
end

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

function sa
    eval (ssh-agent -c)
    ssh-add
end

### Python

abbr --add fastapi "python -m debugpy --listen 0.0.0.0:5678 -m uvicorn app.main:app --reload --loop asyncio"
abbr --add mkvirtualenv "uv venv --python"
abbr --add pi "uv pip install"
abbr --add pytest "python -m pytest -s --disable-warnings"
abbr --add jupyterlab "python -m jupyterlab --no-browser"

function pysetup
  uv pip install -r ~/.local/share/chezmoi/requirements.txt
end



### Initializations

zoxide init fish | source
starship init fish | source
