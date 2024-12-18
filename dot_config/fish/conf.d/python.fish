abbr --add deactivate "pyenv deactivate"
abbr --add fastapi "python -m debugpy --listen 0.0.0.0:5678 -m uvicorn app.main:app --reload --loop asyncio"
abbr --add mkvirtualenv "pyenv virtualenv"
abbr --add pi "python -m pip install"
abbr --add pylist "pyenv virtualenvs"
abbr --add pytest "python -m pytest --disable-warnings"
abbr --add rmvirtualenv "pyenv uninstall"
# w means workon
abbr --add w "pyenv activate"
abbr --add jupyterlab "python -m jupyterlab --no-browser"


set -gx PYDEVD_DISABLE_FILE_VALIDATION 1

function pysetup
  python -m pip install -r ~/.local/share/chezmoi/requirements.txt
end
