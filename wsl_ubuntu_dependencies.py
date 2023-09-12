import subprocess

# List of dependencies to be installed
packages = [
    "bat",
    "cmake",
    "curl",
    "exa",
    "fish",
    "fzf",
    "gettext",
    "jq",
    "ninja-build",
    "nodejs",
    "npm",
    "pyenv",
    "ranger",
    "tmux",
    "unzip",
    "zoxide",
]

# Update package list and system
subprocess.run(["sudo", "apt", "update"])
subprocess.run(["sudo", "apt", "autoremove"])
subprocess.run(["sudo", "apt", "dist-upgrade"])

# Upgrade existing packages
subprocess.run(["sudo", "apt", "upgrade", "-y"])

# Install new packages
for package in packages:
    subprocess.run(["sudo", "apt", "install", package, "-y"])

# Install pyenv
# subprocess.run(["curl", "https://pyenv.run", "|", "bash"])

# Install tmux tpm
subprocess.run(["git", "clone", "http://github.com/tmux-plugins/tpm", "~/.tmux/plugins/tmp"])

print("Ubuntu setup complete.")
