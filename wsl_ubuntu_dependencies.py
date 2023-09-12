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
]

# Update package list
subprocess.run(["sudo", "apt", "update"])

# Upgrade existing packages
subprocess.run(["sudo", "apt", "upgrade", "-y"])

# Install new packages
for package in packages:
    subprocess.run(["sudo", "apt", "install", package, "-y"])

print("Ubuntu setup complete.")
