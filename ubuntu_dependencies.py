import subprocess

# List of dependencies to be installed
packages = [
    "bat",  # cat alternative
    "cmake",  # neovim build requirement
    "curl",  # http client
    "exa",  # ls replacement (might need a PPA or snap in Ubuntu)
    "fzf",  # fuzzy finder
    "gettext",  # neovim build requirement
    "jq",  # cli json utility
    "neovim",  # editor
    "ninja-build",  # neovim build requirement, package name 'ninja-build' in Ubuntu
    "ranger",  # cli file manager
    "ripgrep",  # search tool, package name 'ripgrep' in Ubuntu
    "starship",  # shell prompt
    "tree",  # show tree-like folder representation
    "zsh",  # shell
    "zoxide",  # better current dir changing
]

# Update system to the latest version with apt
subprocess.run(["sudo", "apt", "update"])
subprocess.run(["sudo", "apt", "upgrade", "-y"])


# Function to check if package is installed
def is_package_installed(package):
    result = subprocess.run(
        ["dpkg", "-l", package],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )
    return result.returncode == 0


# Install or upgrade packages
for package in packages:
    if not is_package_installed(package):
        subprocess.run(["sudo", "apt", "install", "-y", package])
    else:
        print(f"{package} is already installed.")
