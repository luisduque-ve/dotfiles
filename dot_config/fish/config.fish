if status is-interactive
    # Commands to run in interactive sessions can go here
end

# remove shell greeting
set -g fish_greeting

# fzf alias
alias fzf="fzf -m --query \"'\""
alias f="fzf -m --query \"'\""

# ls replacement
abbr --add ls "exa -l -h --git"

# git
abbr --add g "git"

# chezmoi
abbr --add c "chezmoi"

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

function ssh-add-fzf
    set key_file (find ~/.ssh -type f -name "id_*" -not -name "*.pub" | fzf)
    if test -n "$key_file"
        ssh-add $key_file
    else
        echo "No key selected."
    end
end

# if I don't set this treesitter parser are not installed as
# arm64
alias nvim="arch -arm64 nvim"

set -g fish_key_bindings fish_vi_key_bindings

# path settings
fish_add_path "$HOME/.src/builds/bin"
fish_add_path "/opt/homebrew/bin" "/opt/homebrew/sbin"  "$HOME/.docker/bin"

# initializations
zoxide init fish | source
