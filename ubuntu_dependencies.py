import subprocess
from concurrent.futures import ThreadPoolExecutor

# List of dependencies to be installed
packages = [
    "bat",  # cat alternative
    "cmake",  # neovim build requirement
    "curl",  # http client
    "docker",  # docker, what else can I say? lol
    "eza",  # ls replacement
    "fish",  # shell
    "fzf",  # fuzzy finder
    "gettext",  # neovim build requirement
    "htop",  # system utility
    "jq",  # cli json utility
    "lazygit",  # git client
    "ninja",  # neovim build requirement
    "nvm",  # node version manager
    "ranger",  # cli file manager
    "ripgrep",  # search tool
    "starship",  # shell prompt
    "tmux",  # multiplexer
    "tpm",  # tmux plugin manager
    "tree",  # show tree-like folder representation
    "zoxide",  # better current dir changing
]

# Function to check if Homebrew is installed
def is_homebrew_installed():
    result = subprocess.run(
        ["brew", "--version"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )
    return result.returncode == 0


# Install Homebrew if not installed
if not is_homebrew_installed():
    subprocess.run(
        [
            "/bin/bash",
            "-c",
            "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)",
        ]
    )


# Function to get a list of all installed packages
def get_installed_packages():
    result = subprocess.run(
        ["brew", "list"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )
    if result.returncode == 0:
        return result.stdout.split()
    else:
        return []


# Get the list of installed packages once
installed_packages = get_installed_packages()


# Function to install or upgrade a package
def install_package(package):
    if package not in installed_packages:
        subprocess.run(["brew", "install", package])
    else:
        print(f"{package} is already installed")


# Use ThreadPoolExecutor to install or upgrade packages in parallel
with ThreadPoolExecutor() as executor:
    executor.map(install_package, packages)
