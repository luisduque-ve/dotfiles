# Set PYENV_ROOT and PYENV_VIRTUALENV_DISABLE_PROMPT
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx PYENV_VIRTUALENV_DISABLE_PROMPT 1

# Update PATH using fish_add_path
fish_add_path $PYENV_ROOT/shims
fish_add_path $PYENV_ROOT/bin

# inizialite pyenv
pyenv init - | source

abbr --add deactivate "pyenv deactivate"
abbr --add fastapi "python -m uvicorn main:app --reload"
abbr --add mkvirtualenv "pyenv virtualenv"
abbr --add pi "python -m pip install"
abbr --add pylist "pyenv install --list"
abbr --add pytest "python -m pytest"
abbr --add rmvirtualenv "pyenv virtualenv-delete"
abbr --add virtualenvs "pyenv virtualenvs"
abbr --add workon "pyenv activate"

function prepy -d "Install custom pre-commit config and related Python packages"
    # install my custom pre-commit config
    ln -svf $HOME/.local/share/chezmoi/pre-commit-config.yaml ./.pre-commit-config.yaml
    pre-commit install
    echo '.pre-commit-config.yaml' >> ".git/info/exclude"
end

function py -d "Find and execute a Python file using fzf"
    # Use fd to find all python files recursively, let the user select one with fzf, and then execute it
    set selected_file (fd --type f --extension py | fzf)

    # Check if a file was selected
    if test -n "$selected_file"
        python "$selected_file"
    else
        echo "No file selected"
    end
end
