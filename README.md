# My Dotfiles

This repository contains my personal dotfiles, managed using [chezmoi](https://www.chezmoi.io/). Chezmoi helps you manage your personal configuration files across multiple machines effortlessly and securely.

## HTTPS init
```
chezmoi init --apply luisduque-ve
```

## SSH init
```
chezmoi init --apply git@github.com:luisduque-ve/dotfiles.git
```
## [Per-Machine Configuration](https://www.chezmoi.io/user-guide/manage-machine-to-machine-differences/#use-templates)

For each machine, you should have a unique `~/.config/chezmoi/chezmoi.toml` file which contains machine-specific values. This file is not tracked in the git repository for privacy and security reasons.

### chezmoi.toml Example

Here's an example of what your `chezmoi.toml` file might look like:

```toml
[data]
ai_support = false
brew_path = "/opt/homebrew"
ca_certificate = ""
email = "email used by tools like git"
```

In this file, `email` and `fish_path` are custom variables that can be used in your dotfiles templates.

### Nix

1. Follow the installation instructions [here](https://nixos.org/download/)
2. Install home manager standalone as describe *(IN MAC SCROLL DOWN UNTIL THE DARWIN MODULE and install it as well)*[here](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone)
3. On Ubuntu edit `/etc/nix/nix.conf` and add `experimental-features = nix-command flakes`
3. Do not forget to run `nix-shell '<home-manager>' -A install`
