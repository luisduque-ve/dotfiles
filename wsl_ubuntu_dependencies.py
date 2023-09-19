import subprocess

# this dependes on brew being installed


# List of dependencies to be installed
formulaes = [
    "bat",
    "chezmoi",
    "cmake",
    "curl",
    "exa",
    "fish",
    "fzf",
    "gettext",
    "jq",
    "ninja",
    "pyenv",
    "pyenv-virtualenv",
    "ranger",
    "tmux",
    "tpm",
    "tree",
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

print("Ubuntu setup complete.")
