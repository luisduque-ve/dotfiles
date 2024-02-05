import subprocess

# List of dependencies to be installed
packages = [
    "bat",  # cat alternative
    "chezmoi",  # dotfiles manager
    "cmake",  # neovim build requirement
    "curl",  # http client
    "exa",  # ls replacement
    "fish",  # shell
    "fzf",  # fuzzy finder
    "gettext",  # neovim build requirement
    "jq",  # cli json utility
    "ninja",  # neovim build requirement
    "ranger",  # cli file manager
    "ripgrep",  # ripgrep, package name 'rg' in Arch is 'ripgrep'
    "starship",  # shell prompt
    "tree",  # show tree-like folder representation
    "zoxide",  # better current dir changing
]

# Update system to the latest version with pacman
subprocess.run(["sudo", "pacman", "-Syu", "--noconfirm"])


# Function to check if package is installed
def is_package_installed(package):
    result = subprocess.run(
        ["pacman", "-Q", package],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )
    return result.returncode == 0


# Install or upgrade packages
for package in packages:
    if not is_package_installed(package):
        subprocess.run(["sudo", "pacman", "-S", "--noconfirm", "--needed", package])
    else:
        print(f"{package} is already installed.")
