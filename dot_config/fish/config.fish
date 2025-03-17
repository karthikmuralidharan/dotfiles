fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path ~/bin
fish_add_path ~/.orbstack/bin

# GPG
set -gx GPG_TTY (tty)

# Starship
source (/opt/homebrew/bin/starship init fish --print-full-init | psub)

# Aliases
source ~/.config/fish/config_aliases.fish
source ~/.config/fish/config_secrets.fish

# Created by `pipx` on 2024-10-19 07:36:25
set PATH $PATH /Users/karthik.muralidharan/.local/bin

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/karthik.muralidharan/.cache/lm-studio/bin
