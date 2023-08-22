# homebrew must be installed before running this script
# yabai and skhd installations are not handle in this
# script, you must manually install them

import subprocess

# List of dependencies to be installed
formulaes = [
    "anki",
    "bat",
    "bitwarden",
    "calibre",
    "chezmoi",
    "cmake",
    "curl",
    "doll",
    "firefox",
    "fish",
    "fzf",
    "gettext",
    "grammarly",
    "jq",
    "libreoffice",
    "ninja",
    "pyenv",
    "pyenv-virtualenv",
    "ranger",
    "raycast",
    "thunderbird",
    "tree",
    "wezterm",
    "zoxide",
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
