# Homebrew must be installed before running this script

# for borders and sketchybar
# brew tap FelixKratz/formulae
# brew install sketchybar

import subprocess

# List of dependencies to be installed
formulaes = [
    "anki",  # study
    "bat",  # cat alternative
    "chezmoi",  # dotfiles manager
    "curl",  # http client
    "doll",  # show notifications on status bar
    "eza",  # ls replacement
    "fish",  # shell
    "fzf",  # fuzzy finder
    "jq",  # cli json utility
    "nikitabobko/tap/aerospace",  # tiling window manager
    "node",  # nodejs
    "raycast",  # spootlight alternative
    "rg",  # rip grep
    "starship",  # shell prompt
    "font-sf-pro",  # sketchybar requirement
    "sf-symbols",  # sketchybar requirement
    "tree",  # show tree like folder representation
    "alacritty",  # terminal emulator
    "zellij",
    "zoxide",  # better current dir changing
]


# Function to check if package is installed
def is_package_installed(package: str):
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
