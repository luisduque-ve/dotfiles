#
# WARNING: run conda config --set changeps1 False after a fresh install
#

abbr --add deactivate "conda deactivate"
abbr --add fastapi "python -m uvicorn main:app --reload"
abbr --add mkvirtualenv "conda create --no-default-packages python -n "
abbr --add pi "python -m pip install"
abbr --add pylist "conda env list"
abbr --add pytest "python -m pytest"
abbr --add rmvirtualenv "conda remove --all --name"
# w means workon
abbr --add w "conda activate"
abbr --add jupyterlab "python -m jupyterlab --no-browser"

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
