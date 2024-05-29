import subprocess

# List of dependencies to be installed
packages = [
    "bat",  # cat alternative
    "cmake",  # neovim build requirement
    "curl",  # http client
    "exa",  # ls replacement
    "fish",  # shell
    "fzf",  # fuzzy finder
    "gettext",  # neovim build requirement
    "htop",  # system utility
    "jq",  # cli json utility
    "ninja",  # neovim build requirement
    "ranger",  # cli file manager
    "ripgrep",  # search tool
    "starship",  # shell prompt
    "tmux",  # multiplexer
    "tpm",  # tmux plugin manager
    "tree",  # show tree-like folder representation
    "tree",  # file tree visualizer
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


# Function to check if package is installed
def is_package_installed(package):
    result = subprocess.run(
        ["brew", "list", package],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )
    return result.returncode == 0

# Install or upgrade packages
for package in packages:
    if not is_package_installed(package):
        subprocess.run(["brew", "install", package])
    else:
        subprocess.run(["brew", "upgrade", package])
        print(f"{package} is already installed or upgraded.")
