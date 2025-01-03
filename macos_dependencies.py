# Homebrew must be installed before running this script

import subprocess

# List of dependencies to be installed
formulaes = [
    "anki",  # study
    "bat",  # cat alternative
    "brave-browser",  # default browser
    "chezmoi",  # dotfiles manager
    "curl",  # http client
    "doll",  # show notifications on status bar
    "eza",  # ls replacement
    "fish",  # shell
    "fzf",  # fuzzy finder
    "ghcup",  # haskell tool
    "grammarly-desktop",  # grammar tool
    "haskell-language-server",
    "jq",  # cli json utility
    "nikitabobko/tap/aerospace",  # tiling window manager
    "nvm",  # node version manager
    "openssl",  # pyenv dependency
    "pyenv",  # python version manager
    "pyenv-virtualenv",  # handle pyenv venvs
    "raycast",  # spootlight alternative
    "readline",  # pyenv dependency
    "rg",  # rip grep
    "sqlite3",  # pyenv dependency
    "starship",  # shell prompt
    "tcl-tk",  # pyenv dependency
    "tree",  # show tree like folder representation
    "wezterm",  # terminal emulator
    "xz",  # pyenv dependency
    "zlib",  # pyenv dependency
    "zoom",  # video calling
    "zoxide",  # better current dir changing
    "zsh-syntax-highlighting",
]


# Function to check if package is installed
def is_package_installed(package):
    result = subprocess.run(
        ["brew", "list", "--versions", package.split()[-1]],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )
    return result.returncode == 0


for package in formulaes:
    if not is_package_installed(package):
        subprocess.run(["brew", "install", package])
    else:
        print(f"{package} is already installed, force reinstall if needed")
