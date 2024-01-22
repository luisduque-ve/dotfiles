# My Dotfiles

This repository contains my personal dotfiles, managed using [chezmoi](https://www.chezmoi.io/). Chezmoi helps you manage your personal configuration files across multiple machines effortlessly and securely.

## [Per-Machine Configuration](https://www.chezmoi.io/user-guide/manage-machine-to-machine-differences/#use-templates)

For each machine, you should have a unique `~/.config/chezmoi/chezmoi.toml` file which contains machine-specific values. This file is not tracked in the git repository for privacy and security reasons.

### chezmoi.toml Example

Here's an example of what your `chezmoi.toml` file might look like:

```toml
[data]
email = "email used by tools like git"
fish_path = "/opt/homebrew/bin/fish"
```

In this file, `email` and `fish_path` are custom variables that can be used in your dotfiles templates.
