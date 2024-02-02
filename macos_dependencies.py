# Homebrew must be installed before running this script
# yabai and skhd installations are not handle in this
# script, you must manually install them

import subprocess

# List of dependencies to be installed
formulaes = [
    "anki",  # study
    "bat",  # cat alternative
    "brave-browser",  # default browser
    "calibre",  # local library
    "chezmoi",  # dotfiles manager
    "cmake",  # neovim build requirement
    "curl",  # http client
    "doll",  # show notifications on status bar
    "exa",  # ls replacement
    "fish",  # shell
    "fzf",  # fuzzy finder
    "gettext",  # neovim build requirement
    "grammarly-desktop",  # grammar tool
    "jq",  # cli json utility
    "krisp",  # noise reduction
    "ninja",  # neovim build requirement
    "ranger",  # cli file manager
    "raycast",  # spootlight alternative
    "rg",  # ripgrep
    "starship",  # shell prompt
    "tmux",  # terminal multiplexer
    "tpm",  # tmux package manager
    "tree",  # show tree like folder representation
    "wezterm",  # terminal emulator
    "zoom",  # video calling
    "zoxide",  # better current dir changing
]

# Function to check if package is installed
def is_package_installed(package):
    result = subprocess.run(
        ["brew", "list", "--versions", package],
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
